let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (l, c) = (input[0], input[1])
var char = readLine()!.split(separator: " ").map{ String($0) }.sorted()
var visited = [Bool](repeating: false, count: c)
var result = [String](repeating: "", count: l)
var results = ""
var index = 0

recFunc(0, 0, 0)
print(results)

func recFunc(_ k: Int, _ vowels: Int, _ consonants: Int) {
    if k == l {
        if vowels >= 1, consonants >= 2 {
            results += result.map{ String($0) }.joined(separator: "") + "\n"
        }
        return
    }
    for i in  index ..< c {
        if visited[i] { continue }
        visited[i] = true
        result[k] = char[i]
        index = i
        switch char[i] {
        case "a", "e", "i", "o", "u":
            recFunc(k+1, vowels+1, consonants)
        default:
            recFunc(k+1, vowels, consonants+1)
        }
        
        visited[i] = false
    }
}
