let input = readLine()!.split { $0 == " " }.map { Int($0)! }, (a, b, c) = (input[0], input[1], input[2])
[(a+b)%c, (a+b)%c, (a*b)%c, (a*b)%c].forEach { print($0) }
