import Foundation
import Glibc

public func solution(_ X : Int, _ A : inout [Int]) -> Int {
    var setA = Set<Int>()
    for index in 0..<A.count {
        setA.insert(A[index])
        if setA.count == X {
            return index
        }
    }
    return -1
}
