// 갈 수 있는 모든 경우의 수를 bfs 큐에 넣자.

var visited = [Bool](repeating: false, count: Int(1e5)+1)
let input = readLine()!.split(separator: " ").map{ Int($0)! }
var depth = [Int](repeating: 0, count: Int(1e5)+1)
var queue = [input[0]]
visited[input[0]].toggle()
while true {
    let node = queue.removeFirst()
    if node == input[1]{ break }
    for i in 0..<3 {
        var next: Int
        if i == 0 { next = node-1 }
        else if i == 1 { next = node+1 }
        else { next = node*2 }
        
        if vaild(n: next) {
            queue.append(next)
            depth[next] = depth[node] + 1
            visited[next].toggle()
        }
    }
}
print(depth[input[1]])

func vaild(n: Int) -> Bool {
    if  n < 0 || n > 100000 || visited[n] {
        return false
    }
    return true
}
