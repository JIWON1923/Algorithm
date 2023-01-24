//1. n을 입력받는다.
let n = Int(readLine()!)!
var result = 0
for _ in 0..<n {
    result += isGoodWord() ? 1 : 0
}
print(result)

func isGoodWord() -> Bool {
    var stack: [Character] = []
    
    //2. 만약 문자열의 길이가 홀수라면 0을 리턴한다. (무조건 좋은 단어가 아님)
    let string = readLine()!.map { $0 }
    if string.count % 2 != 0 { return false }
    
    // stack 연산으로, 같은 문자가 연속으로 나온다면 Pop 한다.
    for char in string {
        if stack.isEmpty {
            stack.append(char)
        } else {
            if stack.last! == char {
                stack.removeLast()
            } else {
                stack.append(char)
            }
        }
    }
    return stack.isEmpty
}
