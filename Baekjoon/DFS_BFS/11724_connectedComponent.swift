let datas = readLine()!.split(separator: " ").map{ Int($0)! }
var graph = [[Int]](repeating: [], count: datas[0] + 1)
var visited = [Bool](repeating: false, count: datas[0] + 1)
var result = 0
for _ in 0..<datas[1]{
    let edges = readLine()!.split(separator: " ").map{ Int($0)! }
    graph[edges[0]].append(edges[1])
    graph[edges[1]].append(edges[0])
}
for node in 1...datas[0]{
    if !visited[node]{
        result += dfs(v: node)
    }
}
print(result)


func dfs(v: Int) -> Int{
    visited[v].toggle()
    for node in graph[v]{
        if !visited[node]{
            dfs(v: node) // 여기서 호출된건 신경쓰지 않기!
        }
    }
    return 1
}
