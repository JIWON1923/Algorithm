let t = Int(readLine()!)!
var dp = [0, 1, 1, 1, 2, 2]
for i in 6...100{
    dp.append(dp[i-1] + dp[i-5])
}
for _ in 0..<t{
    print(dp[Int(readLine()!)!])
}
