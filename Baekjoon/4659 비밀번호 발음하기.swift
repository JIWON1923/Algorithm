import Foundation

let vowels: Set<Character> = ["a", "e", "i", "o", "u"]

//1. 테스트케이스가 ‘end’가 아닐 때까지 입력받는다.
while let password = readLine() {
    if password == "end" { break }
    print(verifyPassword(password) ? "<\(password)> is acceptable." : "<\(password)> is not acceptable.")
}

func verifyPassword(_ password: String) -> Bool {
    let setPassword = Set(password)
    
    //2. 모음 (a, e, i, o, u) 중 하나라도 포함되어있는지 확인한다.
    guard !setPassword.intersection(vowels).isEmpty else { return false }
    
    //3. 모음 3개 또는 자음3개가 연속으로 오는지 확인한다.
    guard checkConsecutiveLetter(password) else { return false }
    
    //4. 같은 글자가 두 번 이상 나타나는 것이 있는지 확인한다. (ee, oo는 허용)
    return checkDuplicatedLetter(password)
}

func checkConsecutiveLetter(_ password: String) -> Bool {
    var check = ""
    for char in password {
        check += vowels.contains(char) ? "1" : "0"
    }
    check = check.replacingOccurrences(of: "111", with: "1")
    check = check.replacingOccurrences(of: "000", with: "0")
    return check.count == password.count
}

func checkDuplicatedLetter(_ password: String) -> Bool {
    let password = password.map { $0 }
    for index in 1..<password.count {
        let prev = password[index - 1]
        let now = password[index]
        if prev == now {
            if now == "o" || now == "e" { continue }
            return false
        }
    }
    return true
}
