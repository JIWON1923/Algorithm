//1. 난쟁이의 키를 입력받는다.
var height = [Int]()
for _ in 0..<9 {
    height.append(Int(readLine()!)!)
}

//2. 난쟁이들의 키 합을 계산한다.
let sum = height.reduce(0, +)

//3. 키의 합에서 100을 뺀다. (이를 x라고 하겠다.)
let x = sum - 100

//4. 9명 중 2명을 뽑아 그들의 키의 합이 x라면, 그 둘은 난쟁이가 아닌 것이다. 이를 찾아서 진짜 난쟁이를 찾는다.
outerLoop: for i in 0..<8 {
    for j in i+1..<9 {
        let y = height[i] + height[j]
        if x == y {
            height.remove(at: j)
            height.remove(at: i)
            break outerLoop
        }
    }
}

//print(height.sorted().map { String($0) }.joined(separator: "\n"))
for i in height.sorted() {
    print(i)
}
