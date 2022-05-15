let n = Int(readLine()!)!
var fileSuffix = [String: Int]()
for _ in 0 ..< n {
    let file = readLine()!.split(separator: ".").map{ String($0) }
    let (_, suffix) = (file[0], file[1])
    if fileSuffix[suffix] != nil { fileSuffix[suffix]! += 1 }
    else { fileSuffix[suffix] = 1 }
}
let result = fileSuffix.sorted{ $0.0 < $1.0 }
for (key, value) in result {
    print(key, value)
}
