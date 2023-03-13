let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, l, r) = (input[0], input[1], input[2])

var visited = [[Bool]]()
var map = [[Int]]()

var result = 0


func movePerson(openCity: [(Int, Int)]) {
    var sum = 0
    
    for (y, x) in openCity {
        sum += map[y][x]
    }
    
    for (y, x) in openCity {
        map[y][x] = sum / openCity.count
    }
    
}


func bfs(_ y: Int, _ x: Int) -> Int {
    var trace = [(y, x)]
    visited[y][x] = true
    var queue = [(y, x)]
    
    while !queue.isEmpty {
        let (y, x) = queue.removeFirst()
        
        for i in 0 ..< 4 {
            let ny = dy[i] + y
            let nx = dx[i] + x
            
            guard ny >= 0 && nx >= 0 && ny < n && nx < n else { continue }
            let value = abs(map[ny][nx] - map[y][x])
            guard !visited[ny][nx] && value >= l && value <= r else { continue }
            visited[ny][nx] = true
            queue.append((ny, nx))
            trace.append((ny, nx))
        }
    }
    
    if trace.count == 1 { return 1 }
    movePerson(openCity: trace)
    return 0
}

for _ in 0 ..< n {
    map.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

while true {
    
    var flag = 1
    visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    
    for y in 0 ..< n {
        for x in 0 ..< n {
            guard !visited[y][x] else { continue }
            flag *= bfs(y, x)
        }
    }
    
    if flag != 0 { break }
    
    result += 1
}

print(result)
