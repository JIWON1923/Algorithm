let n = Int(readLine()!)!
let list = readLine()!.split { $0 == " " }.map { Int($0)! }
let v = Int(readLine()!)!
print(list.filter { $0 == v }.count)
