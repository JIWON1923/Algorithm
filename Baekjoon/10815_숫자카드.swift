/*
 숫자 카드는 정수 하나가 적혀져 있는 카드이다. 상근이는 숫자 카드 N개를 가지고 있다. 정수 M개가 주어졌을 때, 이 수가 적혀있는 숫자 카드를 상근이가 가지고 있는지 아닌지를 구하는 프로그램을 작성하시오.
 
 5
 6 3 2 10 -10
 8
 10 9 -5 2 3 4 5 -10
 
 1 0 0 1 1 0 0 1
 */

let n = Int(readLine()!)!
let cards = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let count = cards.count - 1
let m = Int(readLine()!)!
let finds = readLine()!.split(separator: " ").map { Int($0)! }
var result = ""

finds.forEach { find in
    result += String(binarySearch(find))
    result += " "
}
print(result)

func binarySearch(_ target: Int) -> Int {
//    if count == 1 {
//        return cards.contains(target) ? 1: 0
//    }
    var (start, end) = (0, count)
    while start <= end {
        let mid = (start + end) / 2
        let temp = cards[mid]
        if target == temp {
            return 1
        } else if target > temp {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return 0
}
