var info: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
var visited_dfs = [Bool](repeating: false, count: info[0]+1)
var visited_bfs = visited_dfs
var graph = [[Int]](repeating: [], count: info[0]+1)
//Cannot convert value of type '[Any]' to expected argument type 'Int'
//var graph = [Int](repeating: [], count: info[0]+1)
for _ in 1...info[1]{
    let node:[Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[node[0]].append(node[1])
    graph[node[1]].append(node[0])
}

func dfs(v: Int){
    visited_dfs[v] = true
    print(v, terminator: " ")
    for i in graph[v].sorted(){
        if !visited_dfs[i]{
            dfs(v:i)
        }
    }
}

func bfs(v: Int){
    visited_bfs[v] = true
    var queue:[Int] = [v]
    while queue.count != 0{
        let v = queue.removeFirst()
        print(v, terminator: " ")
        for i in graph[v].sorted(){
            if !visited_bfs[i]{
                queue.append(i)
                visited_bfs[i] = true
            }
        }
    }
}

dfs(v:info[2])
print()
bfs(v:info[2])
