let xx = [1, -1, 0, 0]
let yy = [0, 0, 1, -1]
var graph: [[Int]] = []
var queue: [[Int]] = []
var result = 1
var i = 0
let boxes = readLine()!.split(separator: " ").map{ Int($0)! } // 가로, 세로
let m = boxes[0]
let n = boxes[1]
for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map{ Int($0)! })
}
for x in 0..<n {
    for y in 0..<m {
        if graph[x][y] == 1 {
            queue.append([x, y])
        }
    }
}
while i != queue.count {
    let node = queue[i]
    i += 1
    for i in 0...3{
        let dx = node[0] + xx[i]
        let dy = node[1] + yy[i]
        if dx < 0 || dy < 0 || dx >= n || dy >= m {
            continue
        }
        if graph[dx][dy] == 0 {
            graph[dx][dy] = graph[node[0]][node[1]] + 1
            queue.append([dx, dy])
            if result < graph[node[0]][node[1]] + 1{
                result = graph[node[0]][node[1]] + 1
            }
        }
    }
}

//let result = graph.flatMap({ $0 })
//print(result.contains(0) ? -1 : result.max()!-1)
for i in 0..<n{
    if graph[i].contains(0){
        result = 0
    }
}
print(result-1)
