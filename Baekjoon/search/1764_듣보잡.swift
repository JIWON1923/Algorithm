let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (input[0], input[1])
var hear = [String]()
var see = [String]()
var result = ""
var cnt = 0
for _ in 0 ..< input[0] { hear.append(readLine()!) }
hear.sort()
for _ in 0 ..< input[1] { see.append(readLine()!) }
see.sort()
for i in see {
    if let name = search(i) { result += name + "\n"; cnt += 1 }
}
print(cnt)
print(result)

func search(_ name: String) -> String? {
    var (start, end) = (0, n-1)
    while start <= end {
        let mid = (start + end) / 2
        if hear[mid] == name { return name }
        else if hear[mid] < name { start = mid + 1 }
        else { end = mid - 1}
    }
    return nil
}

