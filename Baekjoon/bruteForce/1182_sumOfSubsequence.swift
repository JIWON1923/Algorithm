let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, s) = (input[0], input[1])
let num = readLine()!.split(separator: " ").map{ Int($0)! }
var visited = [Bool](repeating: false, count: input[0])
var result = 0

recFunc(0, 0)
if s == 0 { result -= 1 }
print(result)

func recFunc(_ k: Int, _ sum: Int) {
    if sum == s {
        result += 1
    }
    
    for i in k ..< n {
        if visited[i] { continue }
        visited[i] = true
        recFunc(i + 1, sum + num[i])
        visited[i] = false
    }
}
