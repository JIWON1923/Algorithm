//1. 길이가 101인 배열을 0으로 초기화한다.
var info = [Int](repeating: 0, count: 101)

//2. 주차 비용과 주차 정보를 입력받는다.
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b, c) = (input[0], input[1], input[2])

// 결과를 저장할 변수
var result = 0

//3. 주차 정보를 배열에 저장한다.
for _ in 0..<3 {
    let park = readLine()!.split(separator: " ").map { Int($0)! }
    let (start, end) = (park[0], park[1])
    for index in start..<end { // 떠나는 시간은 포함하지 않는다.
        info[index] += 1
    }
}

for cost in info {
    switch cost {
    case 1:
        result += a
    case 2:
        result += b * cost
    case 3:
        result += c * cost
    default:
        break
    }
}
//4. 배열을 순회하며 총 비용을 계산한다.
print(result)
