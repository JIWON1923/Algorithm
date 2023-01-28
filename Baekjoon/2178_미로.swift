//1. N, M을 입력받는다.
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

//2. 맵을 입력받는다.
var map: [[Int]] = []
var visited = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)

for _ in 0..<n {
    map.append(readLine()!.map { Int(String($0))! })
}

//3. (1,1)부터 BFS를 실행하고
bfs()

// 4. (n,m) 에 저장된 값을 출력한다.
print(visited[n-1][m-1])

func bfs() {
    var queue = [(0, 0)]
    visited[0][0] = 1
    
    while !queue.isEmpty {
        let (y, x) = queue.removeFirst()
        
        for i in 0..<4 {
            let ny = dy[i] + y
            let nx = dx[i] + x
            
            guard ny >= 0 && nx >= 0 && ny < n && nx < m && map[ny][nx] == 1 else { continue }
            if visited[ny][nx] > 0 { continue }
            queue.append((ny, nx))
            visited[ny][nx] = visited[y][x] + 1
        }
    }
}
