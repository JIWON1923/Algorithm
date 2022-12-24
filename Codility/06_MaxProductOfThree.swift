import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var sortedList = A.sorted { $0 > $1 }
    let firstResult = sortedList[0] * sortedList[1] * sortedList[2]
    sortedList.reverse()
    let secondResult = sortedList[0] * sortedList[1] * sortedList.last!
    return max(firstResult, secondResult)
}
