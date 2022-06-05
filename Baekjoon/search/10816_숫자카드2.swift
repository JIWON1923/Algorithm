//첫째 줄에 상근이가 가지고 있는 숫자 카드의 개수 N(1 ≤ N ≤ 500,000)이 주어진다. 둘째 줄에는 숫자 카드에 적혀있는 정수가 주어진다. 숫자 카드에 적혀있는 수는 -10,000,000보다 크거나 같고, 10,000,000보다 작거나 같다.
//
//셋째 줄에는 M(1 ≤ M ≤ 500,000)이 주어진다. 넷째 줄에는 상근이가 몇 개 가지고 있는 숫자 카드인지 구해야 할 M개의 정수가 주어지며, 이 수는 공백으로 구분되어져 있다. 이 수도 -10,000,000보다 크거나 같고, 10,000,000보다 작거나 같다.

/*
 변수
    n = 상근이가 가지고 있는 숫자 카드의 개수
    cards = n개의 정수 (가지고 있는 카드)
    m = 구해야할 카드의 개수
    finds = m개의 정수 (찾고 싶은 카드)
 
 알고리즘 (이분탐색)
    1. cards를 정렬한다.
    2. finds를 하나씩 탐색하여 가장 처음에 나타난 수와 가장 마지막에 나타난 카드의 값을 찾는다.
        2-1. upper - lower = 카드 개수
 */

let n = Int(readLine()!)!
let cards = readLine()!.split(separator:" ").map{ Int($0)! }.sorted()
let m = Int(readLine()!)!
let finds = readLine()!.split(separator: " ").map{ Int($0)! }
var result = ""

for i in 0 ..< m {
    result += String(upperBound(target: finds[i]) - lowerBound(target: finds[i])) + " "
}

print(result)

func lowerBound(target: Int) -> Int {
    var (start, end) = (0, n)
    while start < end {
        let mid = (start + end) / 2
        if target <= cards[mid] { end = mid }
        else { start = mid + 1 }
    }
    return start
}

func upperBound(target: Int) -> Int {
    var (start, end) = (0, n)
    while start < end {
        let mid = (start + end) / 2
        if target < cards[mid] { end = mid }
        else { start = mid + 1 }
    }
    return start
}
