//1. n을 입력받는다.(전체 선수의 수)
let n = Int(readLine()!)!
//2. 이름을 입력받는다.
//3. 성만 분리해서 배열로 만든다.
var names = [Character]()
for _ in 0..<n {
    let input = readLine()!.map { $0 }
    names.append(input[0])
}
//4. 각 원소를 조회하며 딕셔너리로 만든다.
var dict = [Character: Int]()
for name in names {
    if dict.keys.contains(name) {
        dict[name]! += 1
    } else {
        dict[name] = 1
    }
}

//5. value가 5이상인 key를 추출한다.
let result = dict.filter { $0.value >= 5 }

//6. 정렬 후 문자열로 출력한다.
print(result.isEmpty ? "PREDAJA" : String(result.keys.sorted()))
