let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

let input = readLine()!.split { $0 == " " }.map { Int($0)! }, (r, c) = (input[0], input[1])

var map = [[Int]]()
var visited = [[Bool]]()
var cheeses = [(Int, Int)]()
var count = 0
var time = 0

func dfs(_ y: Int, _ x: Int) {
    visited[y][x] = true
    if map[y][x] == 1 {
        cheeses.append((y, x))
        map[y][x] = 0
        return
    }
    
    for i in 0 ..< 4 {
        let ny = dy[i] + y
        let nx = dx[i] + x
        
        guard ny >= 0 && nx >= 0 && ny < r && nx < c else { continue }
        guard !visited[ny][nx] else { continue }
        dfs(ny, nx)
    }
    
}

for _ in 0 ..< r {
    map.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

while true {
    cheeses.removeAll()
    visited = [[Bool]](repeating: [Bool](repeating: false, count: c), count: r)
    dfs(0, 0)
    count = cheeses.count
    
    var isEnd = true
    for y in 0 ..< r {
        for x in 0 ..< c {
            if map[y][x] == 1 {
                isEnd = false
                break
            }
        }
    }
    time += 1
    if isEnd { break }
}
print(time)
print(count)
