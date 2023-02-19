let n = Double(readLine()!)!
let scores = readLine()!.split { $0 == " " }.map { Double($0)! }, m = scores.max()!
let newScores = scores.map { $0 / m * 100 }
print(newScores.reduce(0.0, +) / n)
