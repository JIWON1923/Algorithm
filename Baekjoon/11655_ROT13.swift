//1. 문자열을 입력받아 Character 배열로 만든다.
let inputData = readLine()!.map { $0 }
var result = ""

//2. Character배열을 순회한다.
for char in inputData {
    result += rot13(char)
}
print(result)

func rot13(_ char: Character) -> String {
    
    var asciiValue = Int(char.asciiValue!)
    
    //3. 만약 알파벳이라면, 13을 밀어서 출력한다. (Unicode 활용)
    switch asciiValue {
    case 65...90: // 대문자
        asciiValue += 13
        if asciiValue > 90 {
            asciiValue = asciiValue % 90 + 64
        }
    case 97...122: // 소문자
        asciiValue += 13
        if asciiValue > 122 {
            asciiValue = asciiValue % 122 + 96
        }
    default:
        break
    }
    
    return UnicodeScalar(asciiValue)!.description
}
