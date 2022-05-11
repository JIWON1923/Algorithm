let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n, m) = (input[0], input[1])
var sequence = readLine()!.split(separator: " ").map{ Int(String($0))! }
var result = Set<[Int]>()
var subsequence = [Int](repeating: 0, count: m)
var visited = [Bool](repeating: false, count: n)

sequence.sort()
recFunc(0)


func recFunc(_ depth: Int) {
    
    if depth == m {
        if result.insert(subsequence).inserted {
            print(subsequence.map{ String($0) }.joined(separator: " "))
        }
        return
    }
    
    for i in 0 ..< n {
        if visited[i] { continue }
        visited[i] = true
        subsequence[depth] = sequence[i]
        recFunc(depth+1)
        visited[i] = false
    }
}
