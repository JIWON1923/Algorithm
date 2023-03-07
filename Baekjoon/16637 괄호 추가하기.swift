let n = Int(readLine()!)!
var numbers = [Int]()
var operators = [String]()
var result = Int.min

let input = readLine()!.map { $0 }
for index in 0..<input.count {
    if index % 2 == 0 {
        numbers.append(Int(String(input[index]))!)
    } else {
        operators.append(String(input[index]))
    }
}

func calc(_ oper: String, _ lhs: Int, _ rhs: Int) -> Int {
    switch oper {
    case "+":
        return lhs + rhs
    case "-":
        return lhs - rhs
    case "*":
        return lhs * rhs
    default:
        return 0
    }
}

func solve(_ here: Int, _ number: Int) {
    if here == numbers.count - 1 {
        result = max(number, result)
        return
    }
    
    solve(here + 1, calc(operators[here], number, numbers[here + 1]))
    if here + 2 < numbers.count {
        let next = calc(operators[here + 1], numbers[here + 1], numbers[here + 2])
        solve(here + 2, calc(operators[here], number, next))
    }
    return
}

solve(0, numbers[0])
print(result)

