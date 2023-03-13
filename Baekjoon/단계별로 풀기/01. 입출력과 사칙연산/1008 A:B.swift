let input = readLine()!.split{ $0 == " " }.map { Double($0)! }
print(input[0] / input[1])
