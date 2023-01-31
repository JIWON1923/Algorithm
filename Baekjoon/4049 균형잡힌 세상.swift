while let input = readLine() {
    //1. 문장을 입력받는다.
    //2. 문장이 .이라면 반복문을 종료한다.
    if input == "." { break }
    print(getResult(input) ? "yes" : "no")
}

func getResult(_ input: String) -> Bool {
    let brackets = input.map { $0 }.filter { "()[]".contains($0) }
    var stack: [Character] = []
    
    for bracket in brackets {
        
        //3. 열린 괄호라면, 스택에 넣고, 닫힌 괄호라면 스택에서 뺀다.
        switch bracket {
        case "(", "[":
            stack.append(bracket)
        case ")":
            if stack.isEmpty { return false }
            let data = stack.removeLast()
            guard data == "(" else { return false }
        case "]":
            if stack.isEmpty { return false }
            let data = stack.removeLast()
            guard data == "[" else { return false }
        default:
            continue
        }
    }
    //4. 스택이 비어있다면 yes, 그렇지 않다면 no를 출력한다.
    return stack.isEmpty
}
