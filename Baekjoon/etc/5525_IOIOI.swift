let n = Int(readLine()!)!
let m = Int(readLine()!)!
let s = readLine()!.map{ $0 }

var count = 0
var i = 0
var result = 0

while i < m-2 {
    if String(s[i...i+2]) == "IOI"{
        count += 1
        i += 2
        if count == n{
            count -= 1
            result += 1
        }
    } else {
        i += 1
        count = 0
    }
}
print(result)
