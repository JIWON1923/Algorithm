let n = Int(readLine()!)!
var stepOnce = [Int](repeating: 0, count: n) // 이전 계단은 밟지 않은 경우
var stepTwice = [Int](repeating: 0, count: n) // 두 번 연속 밟는 경우
var score: [Int] = [] // 이렇게 선언해야 append 가능
for _ in 0..<n{
    score.append(Int(readLine()!)!)
}
stepOnce[0] = score[0]
if n > 1{
    stepOnce[1] = score[1]
    stepTwice[1] = score[0] + score[1]
    
    
    for i in 2..<n{
        stepOnce[i] = score[i] + max(stepOnce[i-2], stepTwice[i-2])
        stepTwice[i] = score[i] + stepOnce[i-1]
    }
}
print(max(stepOnce[n-1], stepTwice[n-1]))
