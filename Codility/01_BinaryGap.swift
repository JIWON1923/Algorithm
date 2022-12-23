import Foundation
import Glibc

public func solution(_ N : Int) -> Int {
    var binaryString = String(N, radix: 2)
    let result = binaryString.trimmingCharacters(in: ["0"])
        .split(separator: "1")
        .map { $0.count }
    return result
}
