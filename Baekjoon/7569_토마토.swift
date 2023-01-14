let input = readLine()!.split(separator: " ").map{ Int($0)! } // 가로 세로 높이
let dx = [1, -1, input[1], -input[1], 0, 0]
let dy = [0, 0, 0, 0, 1, -1]
var graph: [[Int]] = []
var queue: [(Int, Int)] = []
for _ in 0 ..< input[1]*input[2] {
    graph.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

for x in 0 ..< input[1] * input[2] {
    for y in 0 ..< input[0] {
        if graph[x][y] == 1 {
            queue.append((x, y))
        }
    }
}
var i = 0, result = 1
while queue.count > i {
    let node = queue[i]
    i += 1
    for i in 0..<6 {
        let x = node.0 + dx[i]
        let y = node.1 + dy[i]
        if check(x: x, y: y) {
            if i == 0, node.0 % input[1] == input[1]-1 { continue } // 위로 못 가게
            if i == 1, node.0 % input[1] == 0 { continue } // 아래로 못 가게
            
            queue.append((x, y))
            graph[x][y] = graph[node.0][node.1] + 1
            result = graph[x][y] > result ? graph[x][y] : result
        }
    }
}
for i in 0..<input[1]*input[2] {
    if graph[i].contains(0) {
        result = 0
        break
    }
}
print(result-1)

func check(x: Int, y: Int) -> Bool{
    if x < 0 || y < 0 || x >= input[1]*input[2] || y >= input[0] || graph[x][y] != 0 {
        return false
    }
    return true
}
