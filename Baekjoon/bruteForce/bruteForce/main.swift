var info : Array<Int> = []
var result : Array<Int> = []
for _ in 1...9{
    info.append(Int(readLine()!)!)
}
info.sort()

for i in 0...8{
    var remove_i = info
    remove_i.remove(at: i)
    for j in 0...7{
        var remove_j = remove_i
        remove_j.remove(at: j)
        
        let sum: Int = remove_j.reduce(into: 0, { (result: inout Int, next: Int) in result  += next})
        if sum == 100{
            result = remove_j
            break
        }
    }
}
for i in result{
    print(i)
}
