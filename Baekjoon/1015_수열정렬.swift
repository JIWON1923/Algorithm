let n = Int(readLine()!)!
let a = readLine()!.split(separator:" ").map{ Int($0)! }
var p = [(Int, Int)]()
var result = [Int](repeating: 0, count: n)

for i in 0 ..< n {
    p.append((i, a[i]))
}
p = p.sorted{ $0.1 < $1.1 }

for i in 0..<n {
    result[p[i].0] = i
}
print(result.map{String($0)}.joined(separator: " "))
