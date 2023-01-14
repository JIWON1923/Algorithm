let n = Int(readLine()!)!
var dict = [Int:Int]()
for _ in 0 ..< n {
    let value = Int(readLine()!)!
    if dict.keys.contains(value) {
        dict[value]! += 1
    } else {
        dict[value] = 1
    }
}
let result = dict.sorted{ $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1}
print(result[0].0)
