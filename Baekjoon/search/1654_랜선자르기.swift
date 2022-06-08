/*
 첫째 줄에는 오영식이 이미 가지고 있는 랜선의 개수 K, 그리고 필요한 랜선의 개수 N이 입력된다. K는 1이상 10,000이하의 정수이고, N은 1이상 1,000,000이하의 정수이다. 그리고 항상 K ≦ N 이다. 그 후 K줄에 걸쳐 이미 가지고 있는 각 랜선의 길이가 센티미터 단위의 정수로 입력된다. 랜선의 길이는 231-1보다 작거나 같은 자연수이다.
 */

/*
 변수
    input[0] = k = 가지고 있는 랜선의 개수 (1 <= k <= 10,000)
    input[1] = n = 필요한 랜선의 개수 (1 <= n <= 1,000,000), k<=n
    lans = 랜선의 길이를 저장하는 배열 (2^31 -1 보다 작음)
 */

let input = readLine()!.split(separator:" ").map{ Int($0)! }
let (k, n) = (input[0], input[1])
var lans = [Int]()
for _ in 0 ..< input[0] { lans.append(Int(readLine()!)!) }
lans.sort()

var (start, end) = (1, lans[k-1])
while start <= end {
    var count = 0
    let mid = (start + end) / 2
    for l in lans { count += (l / mid) }
    if count >= n { start = mid + 1 }
    else { end = mid - 1 }
}
print(end)
