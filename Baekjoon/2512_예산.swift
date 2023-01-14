/*
 첫째 줄에는 지방의 수를 의미하는 정수 N이 주어진다. N은 3 이상 10,000 이하이다.
 다음 줄에는 각 지방의 예산요청을 표현하는 N개의 정수가 빈칸을 사이에 두고 주어진다.
 이 값들은 모두 1 이상 100,000 이하이다. 그 다음 줄에는 총 예산을 나타내는 정수 M이 주어진다.
 M은 N 이상 1,000,000,000 이하이다.

 3 <= n <= 10,000
 budget = 예산요청 값, 1 <= 원소의 값 <= 100,000
 m: 총 예산, n <= m <= 1,000,000,000
 */

let n = Int(readLine()!)!
let budget = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
let m = Int(readLine()!)!
var (start, end) = (0, budget[n-1])

while start <= end {
    let mid = (start + end) / 2
    var tmp = 0
    for b in budget {
        tmp += b >= mid ? mid : b
    }
    if tmp <= m { start = mid + 1 }
    else { end = mid - 1 }
}

print(end)
