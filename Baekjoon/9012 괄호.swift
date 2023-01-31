//1. t를 입력받는다.
let t = Int(readLine()!)!
for _ in 0..<t {
    print(getResult() ? "YES" : "NO")
}


func getResult() -> Bool {
    var stack: [Character] = []
    let brackets = readLine()!.map { $0 }
    
    for bracket in brackets {
        
        switch bracket {
            //2. 열린 괄호면 stack에 넣는다.
        case "(":
            stack.append(bracket)
            //3. 닫힌 괄호면 stack에서 pop 한다.
        case ")":
            if stack.isEmpty { return false }
            stack.removeLast()
        default:
            continue
        }
    }
    //4. 모든 연산이 끝난 후, stack이 비어있는지 확인한 후 결과를 출력한다.
    return stack.isEmpty
}
