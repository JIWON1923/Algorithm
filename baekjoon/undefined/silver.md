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



## 11403 경로 찾기

[문제로 이동](https://www.acmicpc.net/problem/11403)

#### 문제 요약

가중치 없는 그래프 G에서, 노드 i에서 j로 가는 경로가 있는지, 없는지 인접 행렬로 표현해야하는 문제이다.

#### 알고리즘

1. 인접행렬을 입력받아 인접 리스트로 만든다.
2. BFS를 이용하여 탐색하고, 인접 행렬 형태로 표현하여 출력한다.

#### 접근방법

* 인접 리스트를 사용하면 단방향 간선을 표현하기 더 좋다
* 인접리스트로 그래프를 만들어서 방향이 있는 그래프를 표현하고, BFS로 어디를 방문할 수 있는지 계산해보아야한다.
* 이때, 기존 BFS처럼 자기 자신을 방문처리하면 안 된다. (내 자신을 방문할 수 있다는 것을 보장할 수 없기 때문이다.)
* Dictionary 초기화 꿀팁!
  * 딕셔너리의 value가 리스트일 때, 만약 key가 처음 나오는 경우는 대입연산자를 사용해아하고, 이미 key가 존재하면 value에 append 연산을 수행해야한다.
  * 이때 초깃값으로 딕셔너리 key 값에 빈 배열로 모두 초기화해주면 위 연산 없이 항상 append로 처리할 수 있다!

#### 코드

<pre class="language-swift"><code class="lang-swift"><strong>let n = Int(readLine()!)!
</strong>var map = [[Int]]()
var tree = [Int : [Int]]()
Array(0..&#x3C;n).forEach { tree[$0] = [] } // dictionary 초기화

// 인접행렬을 받아 인접리스트 tree에 저장한다.
for y in 0 ..&#x3C; n {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    for x in 0 ..&#x3C; n {
        if input[x] == 1 {
            tree[y]!.append(Int(x))
        }
    }
}

// 모든 노드에 대해 BFS 연산을 수행한다.
Array(0..&#x3C;n).forEach {
    map.append(bfs($0))
}

// 출력 형태에 맞춰 출력한다.
map.forEach {
    $0.forEach { print($0, terminator: " " )}
    print()
}


func bfs(_ node: Int) -> [Int] {
    var result = [Int](repeating: 0, count: n) // 인접 리스트로 표현할 배열, visited와 같은 역할을 한다. 
//    result[node] = 1 -> 자기 자신을 방문처리 하지 않는다.
    
    var queue = [node]
    
    while !queue.isEmpty {
        let n = queue.removeFirst()
        
        guard let tree = tree[n] else { continue } // 딕셔너리[n] 이 자식을 가지고 있는가?
        for i in tree {
            guard result[i] == 0 else { continue } // 아직 방문하지 않았다면
            result[i] = 1 // 인접리스트에 1로 표현한다.
            queue.append(i)
        }
    }
    return result // 인접리스트 한 행을 리턴한다.
}
</code></pre>



## 11725 트리의 부모 찾기

[문제로 이동](https://www.acmicpc.net/problem/11725)

#### 문제 요약

루트 노드가 1인 트리에, 각 노드의 부모 노드 번호를 찾는 문제이다.

#### 알고리즘

1. 입력을 기반으로 인접 리스트로 만든다.
2. 루트 노드(1번노드)부터 BFS를 탐색한다.
3. 부모노드를 찾아 출력한다.
4. Queue에서 pop 된 노드가 부모 노드이고, 이 노드에서 방문가능한 노드들이 자식 노드가된다.&#x20;

주어진 입력을 기반으로 인접 리스트로 만들고, BFS를 이용하여 부모 노드를 출려한다.

#### 접근방법

<details>

<summary>처음 접근했던 방법 (틀렸습니다)</summary>

처음에는 굳이 그래프 탐색을 하지 않고 문제를 풀 수 있다고 생각했다.

result라는 배열에 1만 1로 저장하고, 나머지 노드들에 0을 저장한다. (루트노드가 1이므로)

이후 입력받는 숫자 a, b에 대해서 result\[a] > result\[b] 라면, a가 b의 노드라고 생각할 수 있다. (예제에서는 제대로 출력된다.)



하지만 조금 더 생각하면 완전히 틀린 코드라는 것을 알 수 있다.

예시 코드의 경우 부모노드가 무조건 존재하는 상황밖에 없다. 하지만 다음과 입력을 생각해보자

<pre><code><strong>3
</strong>2 3
1 2
</code></pre>

이 경우는 2와 3을 봤을 때 result\[2], result\[3] 모두 0이며, 다음 입력 1, 2을 본 후에 2가 부모노드라는 것을 알 수 있게 된다.

즉, 입력받은 즉시 부모노드를 결정할 수 없음을 알 수 있다.



#### 틀린 코드

```swift
let n = Int(readLine()!)!
var visited = [Bool](repeating: false, count: n + 1)
var result = [Int](repeating: 0, count: n + 1)
result[1] = 1

// result가 더 큰 것이 부모노드이다
for _ in 1 ..< n {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    let (a, b) = result[input[0]] > result[input[1]] ? (input[0], input[1]) : (input[1], input[0])
    result[b] = a
}

// 결과를 출력한다
for index in 2...n {
    print(result[index])
}
```

</details>

* 입력 받은 값을 기반으로 인접 리스트를 만든다. 이때, 양방향 간선으로 간주하여 작성해야한다. (어떤게 부모인지 모르기 때문에)
* 이후 시작노드 1을 기반으로 그래프 탐색을 수행한다.
* queue 연산을 기준으로 설명하자면
  * pop 된 현재 노드 = 부모 노드
  * 탐색하며, 아직 방문되지 않아서 다음 queue에 들어가는 노드들 = 자식노드
* queue에 다음 탐색할 노드를 넣을 때, result 배열에 부모노드 값을 저장해주자.

#### 코드

```swift
let n = Int(readLine()!)!
var tree = [Int : [Int]]()
Array(1...n).forEach { tree[$0] = [] }
var result = [Int](repeating: 0, count: n + 1)

// 인접리스트로 입력받는다
for _ in 1 ..< n {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }, (a, b) = (input[0], input[1])
    tree[a]!.append(b)
    tree[b]!.append(a)
}

// 시작노드 1을 기반으로 BFS 탐색을 수행한다.
var queue = [1]
while !queue.isEmpty {
    let n = queue.removeFirst()
    
    guard let nodes = tree[n] else { continue }
    
    for i in nodes {
        guard result[i] == 0 else { continue }
        result[i] = n
        queue.append(i)
    }
}

for i in 2...n {
    print(result[i])
}
```
