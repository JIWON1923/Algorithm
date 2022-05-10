let input = readLine()!.split(separator: " ").map{ Int($0)! }
let num = readLine()!.split(separator: " ").map{ Int($0)! }
var visited = [Bool](repeating: false, count: input[0])
var result = 0

recFunc(k: 0, sum: 0)
if input[1] == 0 { result -= 1}
print(result)

func recFunc(k: Int, sum: Int) {
    if sum == input[1] {
        result += 1
    }
    
    for i in k ..< input[0] {
        if visited[i] { continue }
        visited[i] = true
        recFunc(k: i + 1, sum: sum + num[i])
        visited[i] = false
    }
}
