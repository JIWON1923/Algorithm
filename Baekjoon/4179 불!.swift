let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

let input = readLine()!.split { $0 == " " }.map { Int($0)! }, (r, c) = (input[0], input[1])

var map = [[Character]]()
var fireVisited = [[Int]](repeating: [Int](repeating: 0, count: c), count: r)
var personVisited = fireVisited
var result = 0


func fireBFS(_ y: Int, _ x: Int) {
    fireVisited[y][x] = 1
    var queue = [(y, x)]
    
    while !queue.isEmpty {
        let (y, x) = queue.removeFirst()
        
        for i in 0 ..< 4 {
            let ny = dy[i] + y
            let nx = dx[i] + x
            
            guard ny >= 0 && nx >= 0 && ny < r && nx < c else { continue }
            guard map[ny][nx] == "." else { continue }
            
            let newValue = fireVisited[y][x] + 1
            
            guard fireVisited[ny][nx] == 0 || newValue < fireVisited[ny][nx] else { continue }
            fireVisited[ny][nx] = fireVisited[y][x] + 1
            queue.append((ny, nx))
        }
    }
}

func personBFS(_ y: Int, _ x: Int) {
    personVisited[y][x] = 1
    var queue = [(y, x)]
    
    while !queue.isEmpty {
        let (y, x) = queue.removeFirst()
        
        for i in 0 ..< 4 {
            let ny = dy[i] + y
            let nx = dx[i] + x
            
            guard ny >= 0 && nx >= 0 && ny < r && nx < c else {
                // 탈출 성공
                print(personVisited[y][x])
                return
            }
            guard map[ny][nx] == "." && personVisited[ny][nx] == 0 else { continue }
            let newValue = personVisited[y][x] + 1
            guard fireVisited[ny][nx] > newValue || fireVisited[ny][nx] == 0 else { continue }
            personVisited[ny][nx] = newValue
            queue.append((ny, nx))
        }
        result += 1
    }
    print("IMPOSSIBLE")
}


for _ in 0 ..< r {
    map.append(readLine()!.map { $0 })
}



for y in 0 ..< r {
    for x in 0 ..< c {
        if map[y][x] == "F" {
            fireBFS(y, x)
        }
    }
}

for y in 0 ..< r {
    for x in 0 ..< c {
        if map[y][x] == "J" {
            personBFS(y, x)
        }
    }
}
