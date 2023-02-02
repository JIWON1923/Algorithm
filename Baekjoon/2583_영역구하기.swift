// MARK: - BFS
let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

//1. m, n, k를 입력받는다.
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n, k) = (input[0], input[1], input[2])

//2. 사각형 좌표를 이용하여 지도를 그린다.
var map = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)

for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (x1, y1, x2, y2) = (input[0], input[1], input[2], input[3])
    for y in y1..<y2 {
        for x in x1..<x2 {
            map[y][x] = 1
        }
    }
}

var result: [Int] = []

for y in 0..<m {
    for x in 0..<n {
        if map[y][x] == 0 {
            map[y][x] = 1
            result.append(bfs(y, x))
        }
    }
}
print(result.count)
print(result.sorted().map { String($0) }.joined(separator: " "))

func bfs(_ y: Int, _ x: Int) -> Int {
    var count = 1
    var queue = [(y, x)]
    
    while !queue.isEmpty {
        let (y, x) = queue.removeFirst()
        
        for i in 0..<4 {
            let ny = dy[i] + y
            let nx = dx[i] + x
            
            guard ny >= 0 && nx >= 0 && ny < m && nx < n && map[ny][nx] == 0 else { continue }
            map[ny][nx] = 1
            queue.append((ny, nx))
            count += 1
        }
    }
    return count
}

// MARK: - DFS

// direction
let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

// information
var input = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n, k) = (input[0], input[1], input[2])
var result = [Int]()

// map
var map = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
var visited = map
for _ in 0..<k {
    input = readLine()!.split(separator: " ").map { Int($0)! }
    let (x1, y1, x2, y2) = (input[0], input[1], input[2], input[3])
    
    for y in y1..<y2 {
        for x in x1..<x2 {
            map[y][x] = 1
        }
    }
}

// dfs 실행
for y in 0..<m {
    for x in 0..<n {
        if map[y][x] == 0 && visited[y][x] == 0 {
            result.append(dfs(y, x))
        }
    }
}

print(result.count)
print(result.sorted().map{ String($0) }.joined(separator: " "))

func dfs(_ y: Int, _ x: Int) -> Int {
    var count = 1
    visited[y][x] = 1
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        guard ny < m && nx < n && ny >= 0 && nx >= 0 else { continue }
        if map[ny][nx] == 0 && visited[ny][nx] == 0 {
            count += dfs(ny, nx)
        }
    }
    
    return count
}

