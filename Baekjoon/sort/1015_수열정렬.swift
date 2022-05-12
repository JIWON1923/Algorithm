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

//vowels-> 모음 / consonants-> 자음

//let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
//let (n, m) = (input[0], input[1])
//var sequence = readLine()!.split(separator: " ").map{ Int(String($0))! }
//var result = Set<[Int]>()
//var subsequence = [Int](repeating: 0, count: m)
//var visited = [Bool](repeating: false, count: n)
//
//sequence.sort()
//recFunc(0)
//var sortedResult = Array(result)
//for i in sortedResult.sorted(by: { $0[0] < $1[0]}) {
//    print(i.map{ String($0) }.joined(separator: " "))
//}
//
//func recFunc(_ depth: Int) {
//    if depth == m {
//        result.insert(subsequence)
//        return
//    }
//    for i in 0 ..< n {
//        if visited[i] { continue }
//        visited[i].toggle()
//        subsequence[depth] = sequence[i]
//        recFunc(depth+1)
//        visited[i].toggle()
//    }
//}

let n = Int(readLine()!)!
let a = readLine()!.split(separator:" ").map{ Int($0)! }
var p = [(Int, Int)]()
var result = [Int](repeating: 0, count: n)

for i in 0 ..< n {
    p.append((i, a[i]))
}
p = p.sorted{ $0.1 < $1.1 }

for i in 0..<n {
    result[p[i].0] = i
}
print(result.map{String($0)}.joined(separator: " "))
