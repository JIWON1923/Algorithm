---
description: 그래프탐색 골드 문제
---

# 🥇 Gold

## 1707 이분 그래프

[문제로 이동](https://www.acmicpc.net/problem/1707)

#### 문제 요약

그래프의 정점 집합을 두개로 분할하여, 각 집합에 속한 정점끼리는 서로 인접하지 않도록 분할할 수 있을 때, 이분 그래프라고 부른다. 그래프가 주어졌으 ㄹ때, 이분그래프인지 판별하는 프로그램을 작성해야한다.

#### 알고리즘

1. 정보를 입력받고, 테스트케이스만큼 반복한다.
2. 그래프를 무방향 그래프로 입력받는다. (양방향 간선)
3. 전체 노드에 대해 bfs를 탐색하며 이분 그래프인지 판별한다.
4. 결과를 출력한다.

#### 접근방법

* 우선 나는 문제를 보고 이분 그래프의 정확한 정의를 알지 못했다. (그래프에 사이클이 있는가를 확인하는 문제가 아니라는 것이다)
  * 위키에 이분 그래프의 정의를 보면 다음과 같이 나와있다.
  * "모든 꼭짓점을 빨강, 파랑으로 색칠하되, 모든 변이 빨강과 파랑 꼭짓점을 포함하도록 색칠할 수 있다."
  * 즉, ㅇ-ㅇ 라는 두 개의 노드를 연결하는 간선의 입장에서 한 쪽은 빨간색, 다른 한 쪽은 파란색으로 칠할 수 있어야한다는 것이다.
  * 코드 관점으로 생각해보자면 visited\[here]과 visited\[next]의 값이 달라야함을 알 수 있다.
* 주의해야할 점은 하나의 그래프로 주어지지 않을 수 있다는 것이다.
  * 즉, 전체 노드를 방문했는지 확인하는 작업이 필요하다.
  * 나는 현재 tree의 key를 기반으로 탐색하고 있다. 그래서 테스트케이스에서 반드시 트리를 빈 딕셔너리로 한 번 초기화해주는 작업이 필요하다. (또는 v를 따로 저장해서 bfs를 수행해도 괜찮다)
* visited를 -1로 초기화한 이유
  * 나는 원래 visited\[0]으로 방문하지 않았음을 표기했다.
  * 이전과는 다르게 visited 배열에 3가지 정보를 저장해야한다. (아직 방문 안 함, 빨간색, 파란색)
  * 나는 이것을 -1, 0, 1로 표기해서 모듈러 2를 통해 here과 next를 쉽게 표기하고자 한 것이다!

#### 코드

```swift
let testCase = Int(readLine()!)!
var tree = [Int: [Int]]()
var visited = [Int]()

for _ in 0 ..< testCase {
    var flag = true
    getInformation()
    for node in tree.keys {
        if node == 0 { continue }
        if visited[node] == -1 {
            guard bfs(node) else {
                print("NO")
                flag = false
                break
            }
        }
    }
    if flag { print("YES") }
}

// 문제에서 주어지는 정보를 입력받음
func getInformation() {
    
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    let (v, e) = (input[0], input[1])
    
    tree = [Int: [Int]]() // 이거 없으면 런타임 에러. (이전 키 값이 트리에 저장되어 있음)
    Array(0...v).forEach { tree[$0] = [] } // dictionary 초기화
    
    for _ in 0 ..< e {
        let input = readLine()!.split { $0 == " " }.map { Int($0)! }
        let (u, v) = (input[0], input[1])
        tree[u]!.append(v)
        tree[v]!.append(u)
    }
    
    visited = [Int](repeating: -1, count: v + 1)
}

func bfs(_ n: Int) -> Bool {
    var queue = [n]
    visited[n] = 0
    var index = 0
    
    while queue.count > index {
        let here = queue[index]
        index += 1
        guard let child = tree[here] else { continue }
        for next in child {
        
            // visited[here]과 visited[next]가 같다면 이분그래프가 아님
            // here는 방문처리가 되어있으므로 -1과 같을 수 없음
            guard visited[here] != visited[next] else { return false }
            
            // 현재 상황은 here과 next의 visited 값이 다른 상황임.
            // 즉, next는 here과 색상이 다르거나, 아직 방문하지 않은 상황
            // 아직 방문하지 않은 경우만 queue에 삽입한다.
            guard visited[next] == -1 else { continue }
            visited[next] = (visited[here] + 1) % 2
            queue.append(next)
        }
    }
    // ㅇ-ㅇ에서 한 번도 같은 색을 칠한 적 없다면 true를 반환한다.
    return true
}
```

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
