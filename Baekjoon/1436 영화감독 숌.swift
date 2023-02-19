let n = Int(readLine()!)!
var series = 666

var index = 1

// 시리즈 번호와 입력받은 번호가 같을 때 까지 반복한다.
while index < n {
    series += 1
    var temp = series
    
    // series의 길이만큼 반복한다.
    for _ in 0 ..< String(series).count {
        // 666이 나타나면 series 번호
        if temp % 1000 == 666 {
            index += 1
            break
        } else {
            // abcde -> abcd를 확인한다.
            temp /= 10
        }
    }
}

print(series)

