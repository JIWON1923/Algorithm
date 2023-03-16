---
description: 그래프탐색 골드 문제
---

# 🥇 Gold

## 2206 벽 부수고 이동하기

[문제로 이동](https://www.acmicpc.net/problem/2206)

#### 문제 요약

N \* M 행렬로 표현되는 맵이 있다. 0은 이동할 수 있는 길이고 1은 이동할 수 없는 벽이며 상하좌우로 이동할 수 있다. (1, 1)에서 (N, M)까지 최단거리로 이동해야한다. 이동 거리는 시작하는 칸과 끝나는 칸도 포함되어야하며, 이동 중 벽을 한 개 까지 부수고 이동할 수 있다.

#### 알고리즘

1. 맵을 입력받는다. (시간초과 주의)
2. 3차원의 visited 배열을 선언한다.
3. bfs를 수행한다.

#### 접근방법

* 시간초과 때문에 삽질 어어어어어어어엄청 한 문제이다.
* 첫 번째 접근 - (안 될 거 뻔하지만, 무식하게 풀어보자)
  * 지도를 입력받을 때, walls라는 벽의 위치를 모두 입력받은 후, 모든 경우의 수를 탐색하는 방법이다.
  * N, M의 범위가 최대 1,000이므로 $$O(N^2)$$ -> 1,000,000,000,000을 훌쩍.. 넘는다!
  * 너무 당연히 시간초과
* N 번째 접근 - 3차원의 visited 배열을 사용한다. (다른 사람들의 아이디어를 참고했다.. 다섯시간 고민함 ㅎ)
  * visited\[n]\[m]\[2]를 통해서 이제까지 벽을 부순 적 있음?을 확인하는게 핵심 아이디어다.
  * Swift는 3차원 배열 아이디어만으로 이 문제를 풀 수 없다. **시간초과가 발생**하기 때문이다. 우리는 자료구조에 더 신경을 써줘야된다.
    * 기본적으로 이제까지 사용했던 Queue.removeFirst는 O(n)이 소요된다.&#x20;
    * 그래서 이 removeFirst를 바꿔줘야하는데, 나는 두 가지 시도를 했다.
      *   (실패) Queue.reverse -> Queue.removeLast() -> Queue.reverse

          Swift의 reverse()가 O(1)이기 때문에 전혀 문제되지 않을거라 생각했는데, 시간초과가 났다.. ㅎ
      *   (성공) Index를 이용하여 Queue를 탐색하는 방법

          Queue.count > index를 while문의 조건으로 넣는 방법이다.

          앞으로는 이 방법을 적 극 활 용 해야겠다. ㅠㅠㅠㅠㅠㅠㅠ

#### 코드

```swift
// 이동 가능 방향 정의
let dy = [-1, 1, 0, 0]
let dx = [0, 0, 1, -1]

let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }, (n, m) = (input[0], input[1])
var map = [[Bool]]()
var visited = [[[Bool]]](repeating: [[Bool]](repeating: [false, false], count: m), count: n)

for _ in 0 ..< n {
    let input = readLine()!.map { $0 == "0" ? true : false }
    map.append(input)
}

print(bfs())

func bfs() -> Int {
    var queue = [(0, 0, 0, 1)] // (y, x, wall, count)
    visited[0][0][0] = true
    if (n, m) == (1, 1) { return 1 } // 시작위치가 종료위치라면 1을 반환
    
    var index = 0 // 시간초과 해결 방법
    while queue.count > index {
        let (y, x, wall, count) = queue[index]
        index += 1
        
        for i in 0 ..< 4 {
            let ny = dy[i] + y
            let nx = dx[i] + x
            
            // 맵 범위 내에 존재하고, 아직 방문하지 않았다면
            guard 0 ..< n ~= ny && 0 ..< m ~= nx && !visited[ny][nx][wall] else { continue }
            
            // 목적지에 도착했다면 결과 리턴
            if (ny, nx) == (n-1, m-1) { return count + 1 }
            
            // map이 true라면 (길) 방문처리 후 queue에 삽입한다.
            if map[ny][nx] {
                visited[ny][nx][wall] = true
                queue.append((ny, nx, wall, count + 1))
                
            // map이 false이고, 아직까지 벽을 부순 적 없다면
            } else if wall == 0 {
                // 벽 부순 위치에 visited 처리
                visited[ny][nx][1] = true
                // 얘로부터 출발하는 다음 위치부터는 wall에 1이 저장된다.
                queue.append((ny, nx, 1, count + 1))
            }
        }
    }
    // 목적지를 찾지 못했다면
    return -1
}
```

<details>

<summary>시간초과 코드 보기 (완전탐색)</summary>

```swift
let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

let input = readLine()!.split { $0 == " " }.map { Int($0)! }, (n, m) = (input[0], input[1])
var map = [[Int]]()
var walls = [(Int, Int)]()
var visited = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var result = Int.max

for y in 0 ..< n {
    let input = readLine()!.map { Int(String($0))! }
    for x in 0 ..< m {
        if input[x] == 1 {
            walls.append((y, x))
        }
    }
    map.append(input)
}

result = bfs(0, 0)

for (y, x) in walls {
    map[y][x] = 0
    result = min(result, bfs(0, 0))
    map[y][x] = 1
}

print(result == Int.max ? -1 : result)

func bfs(_ y: Int, _ x: Int) -> Int {
    var queue = [(y, x)]
    visited[y][x] = 1
    
    while !queue.isEmpty {
        let (y, x) = queue.removeFirst()
        for i in 0 ..< 4 {
            let ny = dy[i] + y
            let nx = dx[i] + x
            
            guard 0 ..< n ~= ny && 0 ..< m ~= nx && map[ny][nx] == 0 else { continue }
            let next = visited[y][x] + 1
            guard visited[ny][nx] == 0 || next < visited[ny][nx] else { continue }
            if (ny, nx) == (n-1, m-1) {
                return next
            }
            visited[ny][nx] = next
            queue.append((ny, nx))
        }
    }
    return Int.max
}
```



</details>
