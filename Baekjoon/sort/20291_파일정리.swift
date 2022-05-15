let n = Int(readLine()!)!
var fileSuffix = [String: Int]()
for _ in 0 ..< n {
    let file = readLine()!.split(separator: ".").map{ String($0) }
    let (_, suffix) = (file[0], file[1])
    if fileSuffix.keys.contains(suffix) { fileSuffix[suffix]! += 1 }
    else { fileSuffix[suffix] = 1}
}
let result = fileSuffix.keys.sorted()
for i in result {
    print(i, fileSuffix[i]!)
}
