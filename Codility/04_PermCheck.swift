import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    let sumOfA = Set(A).reduce(0) { $0 + $1 }
    let checkSum = A.count * (1 + A.count) / 2
    return sumOfA == checkSum ? 1 : 0
}
