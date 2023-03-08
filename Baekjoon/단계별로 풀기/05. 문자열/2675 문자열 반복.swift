let testCase = Int(readLine()!)!
for _ in 0 ..< testCase {
    let input = readLine()!.split { $0 == " " }, (r, s) = (Int(input[0])!, input[1])
    var result = ""
    s.map { result += String(repeating: $0, count: r)}
    print(result)
}
