let n = Int(readLine()!)!
let input = readLine()!.map { Int(String($0))! }
print(input.reduce(0, +))
