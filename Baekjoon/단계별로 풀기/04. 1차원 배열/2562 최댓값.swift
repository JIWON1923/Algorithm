var (index, result) = (0, 0)
for i in 1...9 {
    let n = Int(readLine()!)!
    if n > result {
        (index, result) = (i, n)
    }
}
[result, index].forEach { print($0) }
