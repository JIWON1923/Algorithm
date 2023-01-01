/*

 */

import Foundation

let n = Int(readLine()!)!
let adventurer = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var result = 0
var tempValue = 0

for value in adventurer {
    tempValue += 1
    if tempValue >= value {
        result += 1
        tempValue = 0
    }
}

print(result)
