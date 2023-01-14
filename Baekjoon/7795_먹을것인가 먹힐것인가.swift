let testcase = Int(readLine()!)!
for _ in 0 ..< testcase {
    var (result, indexA, indexB) = (0, 0, 0)
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let (n, m) = (input[0], input[1])
    let a = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: >)
    let b = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: >)
    
    while indexA < n && indexB < m {
        if a[indexA] > b[indexB] {
            result += m - indexB
            indexA += 1
        } else {
            indexB += 1
        }
    }
    print(result)
}
