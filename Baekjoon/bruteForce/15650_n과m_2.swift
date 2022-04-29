let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = input[0], m = input[1]
var result = [Int](repeating: 0, count: m)
var resultP = ""
rec_func(0)
print(resultP)

func rec_func(_ k: Int) {
    if k == m {
        resultP += result.map{ String($0) }.joined(separator: " ") + "\n"
        return
    }
    for i in 1 ... n {
        if k != 0, result[k-1] >= i { continue }
        result[k] = i
        rec_func(k+1)
    }
}
