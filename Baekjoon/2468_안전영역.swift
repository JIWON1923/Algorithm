let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

//1. n을 입력받는다.
let n = Int(readLine()!)!

//2. 지도를 입력받는다.
var map: [[Int]] = []
for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var result = 0

//3. 높이를 1부터 시작하며 안전영역을 찾는다. (안전영역 = 갈 수 있는 곳)
for i in 1...100 {
    result = max(result, safeArea(height: i))
}
print(result)

func safeArea(height: Int) -> Int {
    var result = 0
    var map = map
    
    for y in 0..<n {
        for x in 0..<n {
            if map[y][x] >= height {
                result += 1
                
                var queue = [(y, x)]
                
                while !queue.isEmpty {
                    let (y, x) = queue.removeFirst()
                    for i in 0..<4 {
                        let ny = y + dy[i]
                        let nx = x + dx[i]
                        
                        guard ny >= 0 && nx >= 0 && ny < n && nx < n else { continue }
                        if map[ny][nx] >= height {
                            map[ny][nx] = 0
                            queue.append((ny, nx))
                        }
                    }
                }
            }
        }
    }
    return result
}
