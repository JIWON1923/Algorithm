let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

//1. 테스트케이스 개수를 입력받는다.
let t = Int(readLine()!)!

for _ in 0..<t {
    print(bfs())
}

func bfs() -> Int {
    //2. m, n, k를 입력받는다.
    var input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m, k) = (input[0], input[1], input[2])
    
    //3. 맵을 입력받는다.
    var map = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    for _ in 0..<k {
        input = readLine()!.split(separator: " ").map { Int($0)! }
        map[input[0]][input[1]] = 1
    }
    
    //4. bfs가 호출되는 수를 계산해서 출력한다.
    var result = 0
    
    for y in 0..<n {
        for x in 0..<m {
            guard map[y][x] == 1 else { continue }
            result += 1
            var queue = [(y, x)]
            
            while !queue.isEmpty {
                let (y, x) = queue.removeFirst()
                for i in 0..<4 {
                    let ny = dy[i] + y
                    let nx = dx[i] + x
                    
                    guard ny >= 0 && nx >= 0 && ny < n && nx < m else { continue }
                    if map[ny][nx] == 1 {
                        map[ny][nx] = 0
                        queue.append((ny, nx))
                    }
                }
            }
            
        }
    }
    
    return result
}

