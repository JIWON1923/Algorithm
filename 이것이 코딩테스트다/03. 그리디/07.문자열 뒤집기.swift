/*
 
 */

let binaryString = readLine()!
var lastValue = -1
var count = 0

for char in binaryString {
    if Int(String(char))! != lastValue {
        count += 1
        lastValue = Int(String(char))!
    }
}

print(count / 2)
