/*
// 랜덤 글자 출력해보기
let input = String(readLine()!)
print(input.randomElement()!)


// 소수 판별 해보기
let num = Int(readLine()!)!
if isPrimeNumber(n: num) { print("소수 맞음") }
else { print("소수 아님") }


func isPrimeNumber(n: Int) -> Bool {
    if n == 2 { return true }
    for i in 2..<num {
        guard num % i != 0 else { return false }
        continue
    }
    return true
}


// 팩토리얼 - 1, 반복문
print(factorial(n: Int(readLine()!)!))
func factorial(n: Int) -> Int {
    var result = 1
    for i in 1...n {
        result *= i
    }
    return result
}


// 팩토리얼 - 2, 재귀함수
print(recFactorial(n: Int(readLine()!)! ))
func recFactorial(n: Int) -> Int {
    if n < 2 { return 1 }
    return n * recFactorial(n: n - 1)
}
*/

//
//let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
//let n = input[0], m = input[1]
//var results = [Int](repeating: 0, count: m)
//var resultP = ""
//rec_func(0)
//print(resultP)
//
//func rec_func(_ k: Int) {
//    if k == m {
//        resultP += results.map{ String($0) }.joined(separator: " ") + "\n"
//        return
//    }
//    for i in 1...n {
//        if k != 0, results[k-1] > i { continue }
//        results[k] = i
//        rec_func(k+1)
//    }
//}

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map{ Int($0)! }
var operators = readLine()!.split(separator: " ").map{ Int($0)! }
var minResult = Int.max
var maxResult = Int.min
rec_Func(numbers[0], 1)
print(maxResult)
print(minResult)
func rec_Func(_ result: Int, _ k: Int) {
    if k == n {
        if result > maxResult { maxResult = result }
        if result < minResult { minResult = result }
    }
    for o in 0 ..< 4 {
        guard operators[o] > 0 else { continue }
        operators[o] -= 1
        if o == 0 { rec_Func(result + numbers[k], k + 1)}
        else if o == 1 { rec_Func(result - numbers[k], k + 1) }
        else if o == 2 { rec_Func(result * numbers[k], k + 1) }
        else { rec_Func(result / numbers[k], k + 1) }
        operators[o] += 1
    }
}
