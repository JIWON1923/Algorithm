let n = Int(readLine()!)!
var coins = [0]
var result = Int.max

// 값 입력 받기. 각 행을 하나의 숫자로 표현한다.
for _ in 0 ..< n {
    var (index, value) = (1, 0)
    let input = readLine()!.map { $0 }
    for i in 0 ..< input.count {
        if input[i] == "T" {
            value += index
        }
        index *= 2
    }
    coins.append(value)
}

go(here: 1)
print(result)

func go(here: Int) {
    if here == n + 1 {
        var sum = 0
        for i in 1 ... (1 << (n-1)) {
            var count = 0
            for j in 1 ... n {
                if coins[j] & i != 0 {
                    count += 1
                }
            }
            sum += min(count, n - count)
        }
        result = min(result, sum)
        return
    }
    
    go(here: here + 1)
    coins[here] = ~coins[here]
    go(here: here + 1)
}
