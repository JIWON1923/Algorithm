import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var setA = Set<Int>()
    for number in A {
        if setA.contains(number) {
            setA.remove(number)
        } else {
            setA.insert(number)
        }
    }
    return setA.first!
}
