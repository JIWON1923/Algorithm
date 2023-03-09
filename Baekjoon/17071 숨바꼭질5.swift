let max = 500000
let input = readLine()!.split { $0 == " " }.map { Int($0)! }, n = input[0]
var k = input[1]
var visited = [[Int]](repeating: [Int](repeating: 0, count: max + 1), count: 2)
visited[0][n] = 1

print( k == n ? 0 : bfs(n))

func bfs(_ x: Int) -> Int {
    var count = 1
    var queue = [x]
    
    while !queue.isEmpty {
        k += count
        if k > max { return -1 }
        if visited[count % 2][k] != 0 { return count }
        let depth = queue.count
        for _ in 0 ..< depth {
            let x = queue.removeFirst()
            for nx in [x+1, x-1, x*2] {
                guard 0...max ~= nx && visited[count % 2][nx] == 0 else { continue }
                visited[count % 2][nx] = visited[(count+1) % 2][x] + 1
                if nx == k { return count }
                queue.append(nx)
            }
        }
        count += 1
    }
    return -1
}
