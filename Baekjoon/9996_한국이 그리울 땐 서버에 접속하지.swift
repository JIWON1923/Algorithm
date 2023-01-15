//1. 파일의 갯수를 입력받는다.
let n = Int(readLine()!)!

//2. 패턴을 입력받아 앞 패턴과 뒷 패턴으로 분리한다.
let pattern = readLine()!.split(separator: "*")
let length = pattern[0].count + pattern[1].count

//3. 입력받은 문자열과 패턴을 비교하여 결과를 출력한다. (일치하면 “DA”, 불일치 시 “NE”)
for _ in 0..<n {
    let input = readLine()!
    var result = input.hasPrefix(pattern[0]) && input.hasSuffix(pattern[1])
    if length > input.count {
        result = false
    }
    print(result ? "DA" : "NE")
}
