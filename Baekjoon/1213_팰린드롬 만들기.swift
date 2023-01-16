//1. 문자열을 입력받는다.
let letters = readLine()!.map { $0 }

//2. 문자를 Key, 나타난 횟수를 value로 dictionary를 만든다.
var dict: [String: Int] = [:]
for letter in letters {
    let key = String(letter)
    if dict.keys.contains(key) {
        dict[key]! += 1
    } else {
        dict[key] = 1
    }
}
print(getResult())

func getResult() -> String {
    
    var result = ""
    
    var oddLetter: [String] = dict.filter { $0.value % 2 != 0 }.map { String($0.key) }
    //3. value를 조회하여 홀수 개인 알파벳이 2개 이상이라면, I'm Sorry Hansoo를 출력한다.
    if oddLetter.count > 1 { return "I'm Sorry Hansoo" }
    oddLetter.append("")
    //4. 알파벳을 사전순으로 정렬한다.
    let sortedDict = dict.sorted(by: <)
    
    
    //5. 홀수개인 것을 제외하고, value의 / 2만큼 배치한다.
    for (key, value) in sortedDict {
        result += String(repeating: key, count: value/2)
    }
    
    //6. 홀수개인 알파벳을 배치한다.
    //7. 나머지 알파벳을 배치한다.
    result = result + oddLetter[0] + String(result.reversed())
    
    return result
}
