let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

var input = readLine()!.split { $0 == " " }.map { Int($0)! }, (m, n) = (input[0], input[1])
input = readLine()!.split { $0 == " " }.map { Int($0)! - 1 }
let (startY, startX, goalY, goalX) = (input[0], input[1], input[2], input[3])
var visited = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
var map = [[Character]]()
var tempPositions = [(Int, Int)]()
var bfsQueue = [(startY, startX)]
var count = 0

for _ in 0 ..< m {
    map.append(readLine()!.map { $0 })
}
visited[startY][startX] = 1
while map[goalY][goalX] == "#" {
    count += 1
    
    while !bfsQueue.isEmpty {
        let (y, x) = bfsQueue.removeFirst()
        for i in 0 ..< 4 {
            let ny = dy[i] + y
            let nx = dx[i] + x
            
            guard ny >= 0 && nx >= 0 && ny < m && nx < n && visited[ny][nx] == 0 else { continue }
            visited[ny][nx] = count
            if map[ny][nx] != "0" {
                map[ny][nx] = "0"
                tempPositions.append((ny, nx))
            } else {
                bfsQueue.append((ny, nx))
            }
        }
    }
    bfsQueue = tempPositions
}

print(visited[goalY][goalX])
