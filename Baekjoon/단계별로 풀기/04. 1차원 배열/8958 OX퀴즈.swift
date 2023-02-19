let n = Int(readLine()!)!

for _ in 0 ..< n {
    print(calcScore(readLine()!.map { $0 }))
}

func calcScore(_ answer: [Character]) -> Int {
    var (value, score) = (0, 0)
    for a in answer {
        if a == "X" { value = 0 }
        else { value += 1 }
        score += value
    }
    return score
}
