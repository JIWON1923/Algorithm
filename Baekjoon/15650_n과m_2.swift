let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = input[0], m = input[1]
var result = [Int](repeating: 0, count: m)
var resultP = ""
rec_func(0, 1)
print(resultP)

func rec_func(_ k: Int, _ j: Int) {
    if k == m {
        resultP += result.map{ String($0) }.joined(separator: " ") + "\n"
        return
    }
    if j > n { return }
    for i in j ... n {
        result[k] = i
        rec_func(k+1, i+1)
    }
}
