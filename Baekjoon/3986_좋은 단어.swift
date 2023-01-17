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
    let words = readLine()!.map { $0 }
    if words.count % 2 != 0 { return false }
    
    for char in words {
        //3. stack에서 Pop을 한다.
        if stack.last == char {
            //4. 만약 pop한 것과 넣고자 한 것과 동일하다면 제거한다.
            stack.removeLast()
        } else {
            //5. 다르다면 Push 한다.
            stack.append(char)
        }
    }
    
    //6. 모두 끝난 후 pop 해본다.. 삭제할 수 있는 만큼 삭제한다.
    if !stack.isEmpty {
        for _ in 0..<stack.count/2 {
            let lastData = stack.removeLast()
            let data = stack.removeLast()
            
            if lastData != data { return false }
        }
    }
    return true
}
