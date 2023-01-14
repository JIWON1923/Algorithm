let T: Int = Int(readLine()!)!
var graph:[[Int]] = [[Int]]()
var info: [Int] = [Int]()
for _ in 1...T{
    var result: Int = 0
    info = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let a = [Int].init(repeating: 0, count: info[0]) // 가로길이
    graph = [[Int]].init(repeating: a, count: info[1]) //세로길이만큼 반복
    
    for _ in 0..<info[2]{ // 배추갯수
        let lo: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }
        graph[lo[1]][lo[0]] = 1
    }
    
    // i = info[1], n / j = info[0], m
    for x in 0..<info[1]{
        for y in 0..<info[0]{
            if dfs(x: x, y: y){
                result += 1
            }
        }
    }
    print(result)
}

func dfs(x: Int, y: Int) -> Bool{
    if (x <= -1 || x >= info[1] || y <= -1 || y >= info[0]){
        return false
    }
    if graph[x][y] == 1{
        graph[x][y] = 0
        dfs(x: x-1, y: y)
        dfs(x: x+1, y: y)
        dfs(x: x, y: y-1)
        dfs(x: x, y: y+1)
        return true
    }
    return false
    
}
