func dfs(n: Int){
    
}

var result: Int = 0
let box: [Int] = readLine()!.split(separator: " ").map{Int($0)!}
var graph = [[Int]]()
for _ in 0..<box[1]{
    graph.append( readLine()!.split(separator: " ").map{Int($0)!} )
}
