let input = readLine()!.split{ $0 == " " }.map { Int($0)! }
let (a, b) = (input[0], input[1])
print(a + b)
print(a - b)
print(a * b)
print(a / b)
print(a % b)
