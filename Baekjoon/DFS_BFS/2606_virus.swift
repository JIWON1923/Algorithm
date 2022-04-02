func dfs(n: Int){
    visited[n] = true
    for i in graph[n]{
        if !visited[i]{
            dfs(n: i)
        }
    }
}

let node: Int = Int(readLine()!)!
let edge: Int = Int(readLine()!)!
var graph = [[Int]].init(repeating: [], count: node + 1)
var visited = [Bool].init(repeating: false, count: node+1)

for _ in 1...edge{
    let info = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph[info[0]].append(info[1])
    graph[info[1]].append(info[0])
}

dfs(n: 1)
print( visited.filter{($0) == true}.count - 1 )
