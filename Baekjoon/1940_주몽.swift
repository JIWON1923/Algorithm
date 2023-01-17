//1. n을 입력받는다.
let n = Int(readLine()!)!

//2. m을 입력받는다.
let m = Int(readLine()!)!

//3. 재료들을 입력받는다.
var materials = readLine()!.split(separator: " ").map { Int($0) }

//4. 모든 조합을 구하며, 합이 m 일 때에만 조합으로 취급한다.
var result = 0
for i in 0..<n {
    for j in i+1..<n {
        guard let first = materials[i],
              let second = materials[j] else { continue }
        if first + second == m {
            result += 1
            materials[i] = nil
            materials[j] = nil
        }
    }
}

//5. 나온 결과의 수를 계산하여 출력한다.
print(result)
