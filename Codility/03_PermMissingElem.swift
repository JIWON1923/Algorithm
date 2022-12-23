import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    let maxNumber = A.count + 1
    let sumOfResult = maxNumber * (1 + maxNumber) / 2
    let sumOfList = A.reduce(0) { $0 + $1 }
    return sumOfResult - sumOfList
}
