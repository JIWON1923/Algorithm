let input = readLine()!.split(separator: " ").map{ Int(String($0))! } // n, m
let n = input[0], m = input[1]
var result = [Int](repeating: 0, count: m)
var printResult = ""
recFunc(0)
func recFunc(_ k: Int) {
    if k == m {
        //print(result.map{ String($0) }.joined(separator: " "))
        printResult += result.map{ String($0) }.joined(separator: " ") + "\n"
        return
    }
    for i in 1...n {
        result[k] = i
        recFunc(k + 1)
    }
}
print(printResult)
