//1. n을 입력받는다.
let n = Int(readLine()!)!

//2. scv를 입력받는다.
let scv = readLine()!.split { $0 == " " }.map { Int($0)! }

switch n {
case 3:
    print(solve(a: scv[0], b: scv[1], c: scv[2]))
case 2:
    print(solve(a: scv[0], b: scv[1]))
default:
    print(scv[0] / 9 + (scv[0] % 9 == 0 ? 0 : 1))
}
//3. bfs를 수행한다.
//4. (0, 0, 0)이 되면 종료한다.

func solve(a: Int, b: Int, c: Int) -> Int {
    let moves = [ (-9, -3, -1), (-9, -1, -3), (-3, -9, -1),
    (-3, -1, -9), (-1, -9, -3), (-1, -3, -9) ]
    var visited = [[[Int]]](repeating: [[Int]](repeating:[Int](repeating: 0, count: 64), count: 64), count: 64)
    visited[a][b][c] = 1
    var queue = [(a, b, c)]
    
    while !queue.isEmpty {
        guard visited[0][0][0] == 0 else { break }
        let (a, b, c) = queue.removeFirst()
        
        for (da, db, dc) in moves {
            let na = max(a + da, 0)
            let nb = max(b + db, 0)
            let nc = max(c + dc, 0)
            
            guard visited[na][nb][nc] == 0 else { continue }
            queue.append((na, nb, nc))
            visited[na][nb][nc] += visited[a][b][c] + 1
        }
    }
    return visited[0][0][0] - 1
}

func solve(a: Int, b: Int) -> Int {
    let moves = [ (-9, -3), (-3, -9)]
    var visited = [[Int]](repeating: [Int](repeating: 0, count: 64), count: 64)
    visited[a][b] = 1
    
    var queue = [(a, b)]
    
    while !queue.isEmpty {
        guard visited[0][0] == 0 else { break }
        let (a, b) = queue.removeFirst()
        for (da, db) in moves {
            let na = max(0, a + da)
            let nb = max(0, b + db)
            
            guard visited[na][nb] == 0 else { continue }
            visited[na][nb] = visited[a][b] + 1
            queue.append((na, nb))
        }
    }
    return visited[0][0] - 1
}

