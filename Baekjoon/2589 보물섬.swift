let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (l, w) = (input[0], input[1])
var map = [[Character]]()
var visited = [[Int]]()
var positions = [(Int, Int)]()
var result = 0

for y in 0..<l {
    let input = readLine()!.map { $0 }
    for x in 0..<w {
        if input[x] == "L" { positions.append((y, x)) }
    }
    map.append(input)
}

for y in 0..<l {
    for x in 0..<w {
        guard map[y][x] == "L" else { continue }
        result = max(getDistance(y, x), result)
    }
}
print(result)


func getDistance(_ y: Int, _ x: Int) -> Int {
    visited = [[Int]](repeating: [Int](repeating: 0, count: w), count: l)
    var distance = 0
    var queue = [(y, x)]
    visited[y][x] = 1
    
    while !queue.isEmpty {
        let (y, x) = queue.removeFirst()
        
        for i in 0..<4 {
            let ny = dy[i] + y
            let nx = dx[i] + x
            
            guard ny >= 0 && nx >= 0 && ny < l && nx < w else { continue }
            guard visited[ny][nx] == 0 && map[ny][nx] == "L" else { continue }
            visited[ny][nx] = visited[y][x] + 1
            distance = visited[ny][nx]
            queue.append((ny, nx))
        }
    }
    return distance - 1
}
