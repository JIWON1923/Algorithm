print(readLine()!.split { $0 == " " }.map { String($0.reversed()) }.max()!)
