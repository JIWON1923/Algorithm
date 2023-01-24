while let input = readLine() {
    let n = Int(input)!
    var count = 1, result = 1
    
    while true {
        if count % n == 0 {
            print(result)
            break
        } else {
            count = (count * 10) + 1
            count %= n
            result += 1
        }
    }
}
