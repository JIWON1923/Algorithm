//1. 수열을 입력받는다
//2. 오큰수를 계산한다
/*
 값을 입력받는다.
 입력받은 값과 직전 값을 비교한다. 만약 입력받은 값이 크다면, 해당 값은 직전 값의 오큰수이다. (stack 젤 위에 있는 것이 더 작을때까지 반복한다.)
 
 */

let n = Int(readLine()!)!
let numbers = readLine()!.split { $0 == " " }.map { Int($0)! }
var stack = [Int]()
var result = [String](repeating: "-1", count: n)

for i in 0 ..< n {
    while !stack.isEmpty {
        guard numbers[stack.last!] < numbers[i] else { break }
        result[stack.removeLast()] = String(numbers[i])
    }
    stack.append(i)
}

print(result.joined(separator: " "))
