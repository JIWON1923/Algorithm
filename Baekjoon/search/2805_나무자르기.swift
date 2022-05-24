let input = readLine()!.split(separator: " ").map{ Int($0)! }
let trees = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
var (start, end) = (0, trees[input[0] - 1])
let want = input[1]
var result = 0

while start <= end {
    let mid = (start + end) / 2
    var sum = 0
    for tree in trees {
        if tree > mid { sum += tree - mid }
    }
    if sum < want { end = mid - 1 }
    else {
        result = mid
        start = mid + 1
    }
}

print(result)


