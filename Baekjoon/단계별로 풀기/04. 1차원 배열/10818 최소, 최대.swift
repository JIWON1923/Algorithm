let n = Int(readLine()!)!
let list = readLine()!.split { $0 == " " }.map { Int($0)! }
print(list.min()!, list.max()!)
