import Foundation
import Glibc

public func solution(_ N : Int) -> Int {
    var result = Set<Int>()
    for i in 1...Int(sqrt(Double(N))) {
        if N % i == 0 {
            result.insert(i)
            result.insert(N / i)
        }
    }
    return result.count
}
