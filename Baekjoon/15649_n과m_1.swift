let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = input[0], m = input[1]
var selected = [Int](repeating: 0, count:m)
var visited = [Bool](repeating: false, count: n+1)
var result = ""
rec_func(0)
print(result)


func rec_func(_ k: Int) {
    if k == m {
        result += selected.map{ String($0) }.joined(separator: " ") + "\n"
        return
    }
    for i in 1...n {
        if visited[i] { continue }
        selected[k] = i
        visited[i] = true
        rec_func(k+1)
        visited[i] = false
    }
}
