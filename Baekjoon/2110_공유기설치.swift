let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (input[0], input[1])
var pointer = [Int]()
for _ in 0 ..< n {
    pointer.append(Int(readLine()!)!)
}
pointer.sort()
var (start, end) = (1, pointer[n - 1] - pointer[0] + 1 )

while (start < end) {
    let mid = (start + end) / 2
    if check(mid) < m { end = mid }
    else { start = mid + 1 }
}

print(start - 1)

func check(_ d: Int) -> Int {
    var result = 1
    var prev = pointer[0]
    
    for i in 1 ..< n {
        if pointer[i] - prev >= d {
            result += 1
            prev = pointer[i]
        }
    }
    return result
}
