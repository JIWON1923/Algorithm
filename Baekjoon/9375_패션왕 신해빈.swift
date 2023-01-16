//1. 테스트 케이스를 입력받아 반복한다.
let input = Int(readLine()!)!
for _ in 0..<input {
    print(combination())
}

func combination() -> Int {
    var dict = [String: [String]]()
    
    //2. n을 입력받는다.
    let n = Int(readLine()!)!
    
    //3. 이름과 종류를 입력받고, 종류를 key, 이름을 value로 딕셔너리에 저장한다.
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { String($0) }
        let value = input[0], key = input[1]
        if dict.keys.contains(key) {
            dict[key]!.append(value)
        } else {
            dict[key] = [value]
        }
    }
    
    //4. 딕셔너리의 종류들 간 조합의 수를 계산하고 1을 빼서 출력한다 (알몸인 경우 제외)
    let values = dict.values.map { $0.count + 1 }
    return values.reduce(1, *) - 1
    
    /*
     3 -> 1 : 3가지
     hat headgear
     sunglasses eyewear
     turban headgear
     
     headgear = [hat, turban] -> 3
     sunglasses = [eyewear] -> 2
     -> 6 - 1 = 5
     */
}
