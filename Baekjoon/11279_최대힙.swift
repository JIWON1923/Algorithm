let n = Int(readLine()!)!
var maxHeap = [0]
for _ in 0 ..< n {
    let cmd = Int(readLine()!)!
    if cmd == 0 { popNode() }
    else { insertNode(node: cmd) }
}

func insertNode(node: Int){
    maxHeap.append(node)
    var index = maxHeap.count-1
    while maxHeap[index] > maxHeap[index/2] {
        if index == 1 { break }
        maxHeap.swapAt(index, index/2)
        index /= 2
    }
}

func popNode() {
    if maxHeap.count == 1 { print(0); return }
    print(maxHeap[1])
    var index = 1
    maxHeap[1] = maxHeap[maxHeap.count - 1]
    maxHeap.removeLast()
    while true {
        // 자식이 하나일 때
        if index * 2 == maxHeap.count - 1 {
            if maxHeap[index] < maxHeap[index * 2] {
                maxHeap.swapAt(index, index * 2)
                break
            }
        }
        // 자식이 두 개
        else if  index * 2 + 1 < maxHeap.count {
            if maxHeap[index] < max(maxHeap[index * 2], maxHeap[index * 2 + 1]) {
                let i = maxHeap[index * 2] > maxHeap[index * 2 + 1]
                ? index * 2 : index * 2 + 1
                maxHeap.swapAt(index, i)
                index = i
                continue
            }
        }
        break
    }
    
}
