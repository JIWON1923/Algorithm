import Foundation

//1. h, w을 입력받는다.
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (h, w) = (input[0], input[1])

//2. map를 선언한다. (최종 결과)
var map = [[Int]](repeating: [Int](repeating: 0, count: w), count: h)

//3. 구름을 입력받고, vistied에 적용한다.
for y in 0..<h {
    let info = readLine()!.map { $0 }
    for x in 0..<w {
        guard info[x] == "c" else { continue }
        for i in x..<w {
            map[y][i] = i-x
        }
        map[y][x] = -2
    }
    map[y] = map[y].map { $0 == 0 ? -1 : $0 }
    map[y] = map[y].map { $0 == -2 ? 0 : $0 }
}

for y in map {
    print(y.map { String($0) }.joined(separator: " "))
}
