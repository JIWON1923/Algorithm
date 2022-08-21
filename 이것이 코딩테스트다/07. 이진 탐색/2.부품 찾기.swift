/*
 문제) p.197
    전자 매장에 부품 N개가 있다. 각 부품은 정수 형태의 고유한 번호가 있다.
    손님이 M개 종류의 부품을 대량으로 구매하겠다며, 견적서를 요청했다.
    가게 안에 부품이 모두 있는지 확인하는 프로그램을 작성해보자
 
    예시 N = 5
    [8, 3, 7, 9, 2]
    M = 3
    [5, 7, 9]
    각 부품이 존재하면 yes, 없으면 no를 출력해라.
 */

let n = Int(readLine()!)!
let parts = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let m = Int(readLine()!)!
let estimate = readLine()!.split(separator: " ").map { Int($0)! }
var results = ""

estimate.forEach { part in
    results += findPart(target: part) == -1 ? "no" : "yes"
    results += " "
}

print(results)

func findPart(target: Int) -> Int {
    var (start, end) = (0, parts.count)
    while start <= end {
        let mid = (start + end) / 2
        if parts[mid] == target {
            return mid
        } else if parts[mid] > target {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return -1
}
