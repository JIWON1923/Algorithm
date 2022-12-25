import Foundation
import Glibc

public func solution(_ S : inout String) -> Int {
    var stack = [String]()
    for char in S {
        if char == "(" {
            stack.append(String(char))
        } else {
            if stack.isEmpty { return 0 }
            if stack.removeLast() != "(" { return 0 }
        }
    }
    return stack.isEmpty ? 1 : 0
}
