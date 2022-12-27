/* '(' 또는 ')' 로만 이루어진 문자열 s가 주어졌을 때, 문자열 s가 올바른 괄호이면 true를 return 하고,
 올바르지 않은 괄호이면 false를 return 하는 solution 함수를 완성해 주세요.
 */

import Foundation

func solution(_ s:String) -> Bool
{
    var stack: [String] = []
    
    for bracket in s {
        if bracket == "(" {
            stack.append(String(bracket))
        } else {
            if stack.isEmpty { return false }
            if stack.removeLast() != "(" { return false }
        }
    }
    return stack.isEmpty
}
