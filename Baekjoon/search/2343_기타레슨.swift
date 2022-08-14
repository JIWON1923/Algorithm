/*
 첫째 줄에 강의의 수 N (1 ≤ N ≤ 100,000)과 M (1 ≤ M ≤ N)이 주어진다. 다음 줄에는 강토의 기타 강의의 길이가 강의 순서대로 분 단위로(자연수)로 주어진다. 각 강의의 길이는 10,000분을 넘지 않는다.

 n: 강의의 수, 1 <= n <= 100,000
 m: 블루레이 수, 1 <= m <= n
 */

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let blueRay = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (input[0], input[1])
let sum = blueRay.reduce(0, +)
var (start, end) = (blueRay.max()!, sum)

while start <= end {
    let mid = (start + end) / 2
    var (cnt, tmp) = (0, 0)
    for b in blueRay {
        tmp = tmp + b > mid ? b : tmp + b
        if tmp == b { cnt += 1 }
    }
    if cnt > m { start = mid + 1 }
    else { end = mid - 1 }
}

print(start)
