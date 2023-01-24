let input = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b, c) = (input[0], input[1], input[2])
print(go(a, b))

func go(_ a: Int, _ b: Int) -> Int {
    if b == 1 { return a % c }
    var result = go(a, b/2)
    result = result * result % c
    if b % 2 != 0 { result = result * a % c }
    return result
}
    
