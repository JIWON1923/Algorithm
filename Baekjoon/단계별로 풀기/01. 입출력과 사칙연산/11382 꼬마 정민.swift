print(readLine()!.split { $0 == " " }.map { Int($0)! }.reduce(0, +))
