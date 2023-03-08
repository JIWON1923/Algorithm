let input = readLine()!.map { $0 }
var result = [Int](repeating:-1, count: 26)

for i in 0 ..< input.count {
    let index = Int(input[i].asciiValue! - Character("a").asciiValue!)
    guard result[index] == -1 else { continue }
    result[index] = i
}

result.forEach { print($0, terminator: " ")}
