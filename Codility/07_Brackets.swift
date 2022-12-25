import Foundation
import Glibc

public func solution(_ S : inout String) -> Int {
    let startBracket = "{(["
    var stack = [String]()
    
    for char in S {
        if startBracket.contains(char) {
            stack.append(String(char))
        } else {
            if stack.isEmpty {
                return 0
            } else {
                let data = stack.removeLast()
                if !((data == "{" && char == "}") ||
                (data == "(" && char == ")") ||
                (data == "[" && char == "]")) {
                        return 0
                }
            }
        }
    }
    return stack.isEmpty ? 1 : 0
}
