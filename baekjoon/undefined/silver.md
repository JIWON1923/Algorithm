---
description: 그래프 탐색 Silver 단계 문제 풀이 모음
---

# 🥈 Silver

## 4963 섬의 개수

[문제로 이동](https://www.acmicpc.net/problem/4963)

#### 문제 요약

섬이 몇 개인지 찾는 문제이다. 즉, 주어진 인접행렬에서 그래프가 몇 개 있는지 확인해야한다. (연결된 컴포넌트가 몇개야?)

특이한 건 대각선까지 연결된 컴포넌트로 정의한다는 것이다



#### 알고리즘

1. 입력으로 "0 0"이 들어올 때까지 반복한다.
2. map (지도)를 입력받는다.
3. w, h 크기에 맞춰 visited를 초기화한다.
4. map을 순회하며, 아직 방문하지 않았고, 섬이라면 BFS를 실행한다.
5. BFS를 몇 번 순회했는지 출력한다.

#### 접근 방법

* BFS에 map, visited를 매개변수로 계속 넣고싶지 않다면, 전역으로 선언하자!
* 테스트케이스가 지정되지 않았다면, while문을 통해 입력받아야한다.

#### 코드

<pre class="language-swift"><code class="lang-swift"><strong>// 이동 방향 정의
</strong><strong>let dy = [1, 1, 1, 0, 0, -1, -1, -1]
</strong>let dx = [-1, 0, 1, -1, 1, -1, 0, 1]

var map = [[Int]]()
var visited = [[Bool]]()

// 주어진 데이터 입력 받기
while let input = readLine() {
    if input == "0 0" { break }
    let input = input.split { $0 == " " }.map { Int($0)! }, (w, h) = (input[0], input[1])
    var count = 0
    map = []
    
    for _ in 0 ..&#x3C; h {
        map.append(readLine()!.split { $0 == " " }.map { Int($0)! })
    }
    visited = [[Bool]](repeating: [Bool](repeating: false, count: w), count: h)
    
    for y in 0 ..&#x3C; h {
        for x in 0 ..&#x3C; w {
            if map[y][x] == 1 &#x26;&#x26; !visited[y][x] {
                count += 1
                bfs(y, x, h, w)
            }
        }
    }
    print(count)
}

// bfs
func bfs(_ y: Int, _ x: Int, _ h: Int, _ w: Int ) {
    
    var queue = [(y, x)]
    visited[y][x] = true
    
    while !queue.isEmpty {
        let (y, x) = queue.removeFirst()
        
        for i in 0 ..&#x3C; 8 {
            let ny = dy[i] + y
            let nx = dx[i] + x

            guard 0..&#x3C;h ~= ny &#x26;&#x26; 0..&#x3C;w ~= nx &#x26;&#x26; map[ny][nx] == 1 &#x26;&#x26; !visited[ny][nx] else { continue }
            visited[ny][nx] = true
            queue.append((ny, nx))
        }
    }
}
</code></pre>



## 7562 나이트의 이동

[문제로 이동](https://www.acmicpc.net/problem/7562)

#### 문제 요약

체스 판 위에 나이트를 이동시키면서 특정 (y, x)에 도달하기 위해 몇 번 움직여야하는지 계산해야한다. 즉, (y, x)에 도달하기 위한 최단거리가 얼마인지 구하는 문제라는 것을 알 수 있다.

#### 알고리즘

1. test case만큼 반복한다.
2. 체스 판의 크기, 시작 위치, 목표 위치를 입력받는다.
3. 체스 판의 크기만큼 visited 배열을 선언한다.
4. BFS를 수행해서 최단거리를 계산한다.

#### 접근방법

* 나이트의 이동방향을 잘 계산해야한다. (좌표를 그려서 생각해보자)
* 최단거리이기 때문에 visited 배열을 Int로 선언하고, 움직일 때마다 +1을 해서 depth를 구하자.
*   목표 지점에 닿았다면, visited\[goalY]\[goal\[X] - 1을 출력해야한다.

    첫 위치는 움직이지 않고 도달하기 때문에 depth는 0인데, 편의상 visited에 1로 방문처리 했기 때문이다.

    이것이 헷갈린다면 visited를 -1로 초기화해도 된다! 또는 visited\[y]\[x]로 바로 출력해버리자!
* 만약 시작 위치가 목표지점이라면 0을 출력해야한다.

#### 코드

```swift
// 나이트가 이동할 수 있는 방향
let dy = [2, 2, 1, 1, -1, -1, -2, -2]
let dx = [-1, 1, -2, 2, -2, 2, -1, 1]

// 정보를 입력받고, testcase만큼 bfs를 수행한다.
var visited = [[Int]]()
let testCase = Int(readLine()!)!
for _ in 0 ..< testCase {
    let l = Int(readLine()!)!
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }, (x, y) = (input[0], input[1])
    let input2 = readLine()!.split { $0 == " " }.map { Int($0)! }, (goalX, goalY) = (input2[0], input2[1])
    visited = [[Int]](repeating: [Int](repeating: 0, count: l), count: l)
    print(bfs(y, x, goalY, goalX, l))
}

func bfs(_ y: Int, _ x: Int, _ goalY: Int, _ goalX: Int, _ l: Int) -> Int {

    // 시작위치와 목표위치가 같다면 0을 리턴한다. 
    guard (y, x) != (goalY, goalX) else { return 0 }
    var queue = [(y, x)]
    visited[y][x] = 1
    
    while !queue.isEmpty {
        let (y, x) = queue.removeFirst()
        for i in 0 ..< dy.count {
            let ny = dy[i] + y
            let nx = dx[i] + x
                        
            guard 0..<l ~= ny && 0..<l ~= nx && visited[ny][nx] == 0 else { continue }
            visited[ny][nx] = visited[y][x] + 1
            
            // 목표지점에 도달했다면, depth를 리턴한다.
            if ny == goalY && nx == goalX { return visited[y][x] }
            queue.append((ny, nx))
        }
    }
    return 0 // 무조건 목표지점에 도달할 수 있기 때문에 이 코드는 실행되지 않는다.
}
```
