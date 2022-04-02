func dfs(x: Int, y: Int) -> Int{
    if (x <= -1 || x >= n || y <= -1 || y >= n){
        return 0
    }
    
    if graph[x][y] == 1 {
        graph[x][y] = 0 // 방문처리
        let a = dfs(x: x, y: y-1)
        let b = dfs(x: x, y: y+1)
        let c = dfs(x: x-1, y: y)
        let d = dfs(x: x+1, y: y)
        return a + b + c + d + 1
    }
    return 0
}

let n: Int = Int(readLine()!)!
var graph: [[Int]] = []
var result: [Int] = []

for _ in 0..<n{
    graph.append(readLine()!.map{ Int(String($0))! })
}

for i in 0 ..< graph.count{
    for j in 0..<graph[0].count{
        let tmp = dfs(x: i, y: j)
        if tmp != 0{
            result.append(tmp)
        }
    }
}

print(result.count)
for i in result.sorted(){
    print(i)
}
