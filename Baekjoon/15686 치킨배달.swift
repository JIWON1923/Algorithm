let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

//1. n, m  뽑기
var input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

var map = [[Int]]()
var chickens = [(Int, Int)]()
var visited = [[Int]]()
var result = Int.max

// 지도
for y in 0 ..< n {
    input = readLine()!.split(separator: " ").map { Int($0)! }
    for x in 0 ..< n {
        if input[x] == 2 {
            chickens.append((y, x))
        }
    }
    map.append(input.map { $0 == 2 ? 0 : $0 })
}

combination(start: -1, list: [])

print(result)



//2. 치킨집 경우의 수 뽑기 chickens 중 m개를 뽑아야 함. -> 조합
func combination(start: Int, list: [Int]) {
    
    if !list.isEmpty && list.count <= m {
        result = min(solve(list: list), result)
    }
    
    var temp = list
    for i in start + 1 ..< chickens.count {
        temp.append(i)
        combination(start: i, list: temp)
        temp.removeLast()
    }
}


func solve(list: [Int]) -> Int {
    
    visited = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    
    var distance = 0
    
    for index in list {
        let (y, x) = chickens[index]
        map[y][x] = 2
    }
    
    for y in 0 ..< n {
        for x in 0 ..< n {
            if map[y][x] == 1 {
            distance += getMinDistance(list: list, homeX: x, homeY: y)
            }
        }
    }
    
    for index in list {
        let (y, x) = chickens[index]
        map[y][x] = 0
    }
    
    return distance
}

//3. 탐색
func getMinDistance(list: [Int], homeX: Int, homeY: Int) -> Int {
    var distance = Int.max
    for index in list {
        let (y, x) = chickens[index]
        distance = min(abs(homeY - y) + abs(homeX - x), distance)
    }
    return distance
}
