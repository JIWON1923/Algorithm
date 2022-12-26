import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var result = 0
    var localMaxValue = 0
    for value in A {
        localMaxValue = max(value, localMaxValue + value)
        result = max(localMaxValue, result)
    }
    return result
}
