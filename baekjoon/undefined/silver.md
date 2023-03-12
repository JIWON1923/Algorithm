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



