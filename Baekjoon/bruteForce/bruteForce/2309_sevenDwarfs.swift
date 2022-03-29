var info : Array<Int> = []
var first: Int = 0
var second: Int = 0

for _ in 0...8{
    info.append(Int(readLine()!)!)
}
let sum: Int = info.reduce(0, +) - 100

for i in 0...7{
    for j in i+1...8{
        if info[i] + info[j] == sum{
            first = info[i]
            second = info[j]
            break
        }
    }
}

info.remove(at: info.firstIndex(of: first)!)
info.remove(at: info.firstIndex(of: second)!)
for i in info.sorted(){
    print(i)
}
