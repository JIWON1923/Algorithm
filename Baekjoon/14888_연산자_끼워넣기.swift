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
