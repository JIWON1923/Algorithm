import Foundation

//1. h, m을 입력받는다.
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (h, w) = (input[0], input[1])

//2. map를 선언한다. (최종 결과)
var map = [[Int]](repeating:[Int](repeating: -1, count: w), count: h)
var result = ""

//3. 구름을 입력받고, vistied에 적용한다.
for y in 0..<h {
    let clouds = readLine()!.map { $0 }
    for i in 0..<w {
        guard clouds[i] == "c" else { continue }
        for x in i..<w {
            map[y][x] = x - i
        }
    }
    result += map[y].map { String($0) }.joined(separator: " ") + "\n"
}
print(result)

