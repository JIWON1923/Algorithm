let n = Int(readLine()!)!
let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let removeNode = Int(readLine()!)!
var tree = [Int: [Int]]()
var root = 0

for i in 0 ..< n {
    let parent = input[i]
    if parent == -1 { root = i }
    if tree.keys.contains(parent) {
        tree[parent]!.append(i)
    } else {
        tree[parent] = [i]
    }
}

if root == removeNode {
    print(0)
} else {
    print(dfs(here: root))
}


func dfs(here: Int) -> Int {
    var result = 0
    var child = 0
    if let thereList = tree[here] {
        for there in thereList {
            if there == removeNode { continue }
            result += dfs(here: there)
            child += 1
        }
    }
    if child == 0 { return 1}
    return result
}
