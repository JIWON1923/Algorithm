let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
let m = Int(readLine()!)!
let findNumbers = readLine()!.split(separator: " ").map{ Int($0)! }
var result = ""

for i in findNumbers {
    result += search(i) + "\n"
}

print(result)

func search(_ num: Int) -> String {
    var (start, end) = (0, n-1)
    while start <= end {
        let mid = (start + end) / 2
        if numbers[mid] == num { return "1" }
        else if numbers[mid] < num { start = mid + 1 }
        else { end = mid - 1 }
    }
    return "0"
}
