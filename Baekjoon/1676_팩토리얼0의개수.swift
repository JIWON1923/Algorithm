//var graph: [[Int]] = []
//var queue: [(Int, Int)] = []
//let dx = [-1, 1, 0, 0]
//let dy = [0, 0, -1, 1]
//let input = readLine()!.split(separator: " ").map{ Int($0)! } //가로, 세로, 높이
//var result = 0
//for _ in 0..<input[1] {
//    graph.append(readLine()!.split(separator: " ").map{ Int($0)! })
//}
//for x in 0..<input[1] {
//    for y in 0..<input[0] {
//        if graph[x][y] == 1 {
//            queue.append((x, y))
//        }
//    }
//}
//var i = 0
//print(queue)
//print(graph)

//let (x, y) = queue[0]
//while i != queue.count-1 {
//    i += 1
//    for i in 0..<4 {
//        if x + dx[i] < 0 || y + dy[i] < 0 ||
//            x + dx[i] >= input[1] || y + dy[i] >= input[0] { continue }
//
//        if graph[x + dx[i]][y + dy[i]] == 0 {
//            graph[x + dx[i]][y + dy[i]] += graph[x][y] + 1
//            queue.append((x + dx[i], y + dy[i]))
//            result = result < graph[x][y] + 1 ? graph[x][y] + 1 : result
//        }
//    }
//}
//for x in 0..<input[1] {
//    if graph[x].contains(0) {
//        result = -1
//    }
//}
//print(result)

let n = Int(readLine()!)!
print(n / 5 + n / 25)
