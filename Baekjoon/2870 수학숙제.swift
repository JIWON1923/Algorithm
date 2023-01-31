import Foundation

//1. n을 입력받는다.
let n = Int(readLine()!)!
var numbers: [String] = []

//2. 글자를 입력받는다.
for _ in 0..<n {
    let letters = readLine()!
    var number = ""
    
    //    3. 숫자만 배열에 저장한다.
    for char in letters {
        if Int(String(char)) != nil {
            number += String(char)
            continue
        }
        
        if !number.isEmpty {
            numbers.append(considerZero(number))
            number = ""
        }
    }
    if !number.isEmpty { numbers.append(considerZero(number)) }
}

//4. 배열을 정렬하여 출력한다.
numbers = numbers.sorted { $0 < $1 }.sorted { $0.count < $1.count }
print(numbers.joined(separator: "\n"))

func considerZero(_ number: String) -> String {
    
    var newNumber = number
    for _ in 0..<newNumber.count {
        if newNumber.hasPrefix("0") {
            newNumber.removeFirst()
            continue
        }
        break
    }
    
    if newNumber.isEmpty {
        newNumber = "0"
    }
    return newNumber
}
