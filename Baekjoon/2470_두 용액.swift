let n = Int(readLine()!)!
var solution = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
var (start, end) = (0, n-1)
var minValue = Int.max
var result = [start, end]

while start < end {
    let value = solution[start] + solution[end]
    if abs(value) < abs(minValue) {
        result = [start, end]
        if value == 0 { break }
        minValue = value
    }
    
    if value < 0 { start += 1 }
    else { end -= 1 }
}

print(solution[result[0]], solution[result[1]])
