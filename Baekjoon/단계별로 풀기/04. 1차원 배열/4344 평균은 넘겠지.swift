let input = readLine()!.split { $0 == " " }.map { Int($0)!}, (n, x) = (input[0], input[1])
let list = readLine()!.split { $0 == " " }.map { Int($0)! }
list.filter { $0 < x }.forEach { print($0, terminator: " ") }
