let n = Int(readLine()!)!
var minheap = [0]
for _ in 0..<n{
    let cmd = Int(readLine()!)!
    if cmd == 0 {
        popNode()
    } else {
        insertNode(node: cmd)
    }
}

func popNode(){
    if minheap.count == 1 {
        print(0)
        return
    }
    print(minheap[1])
    minheap[1] = minheap[minheap.count-1]
    minheap.removeLast()
    var index = 1
    while true {
        // 자녀가 하나인 경우 (마지막 원소)
        if index*2 == minheap.count-1 {
            if minheap[index] > minheap[index * 2] {
                minheap.swapAt(index, index * 2)
                index *= 2
                break
            }
        }
        else if index*2+1 < minheap.count {
            // 자식이 두개
            if minheap[index] > min(minheap[index * 2], minheap[index * 2 + 1]) {
                let i = minheap[index * 2] > minheap[index * 2 + 1] ? index * 2 + 1 : index * 2
                minheap.swapAt(index, i)
                index = i
                continue
            }
        }
        break
    }
}
    
    
func insertNode(node: Int) {
    minheap.append(node)
    var index = minheap.count-1
    while true {
        if minheap[index] > minheap[index/2] { break }
        minheap.swapAt(index, index/2)
        index /= 2
    }
}
