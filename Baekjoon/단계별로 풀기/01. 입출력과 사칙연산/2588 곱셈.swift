let num1 = Int(readLine()!)!
let num2 = Int(readLine()!)!
let num2Arr = String(num2).map { Int(String($0))! }.reversed()
var result = num2Arr.map { $0 * num1 }
result.append (num1 * num2)
result.forEach { print($0) }
