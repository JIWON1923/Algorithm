//1. n과 m을 입력받는다.
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]

//2. 포켓몬 정보를 저장한다. (0번째는 “”로 초기화)
var pocketmon = [""]
var dict = [String: Int]()
for i in 1...n {
    let input = readLine()!
    pocketmon.append(input)
    dict[input] = i
}

//3. 문자열이라면 first 이용해서 인덱스 출력
//4. 숫자라면 배열 바로 접근해서 출력
for _ in 0..<m {
    let input = readLine()!
    if let data = Int(input) {
        print(pocketmon[data])
    } else {
        print(dict[input]!)
    }
}
