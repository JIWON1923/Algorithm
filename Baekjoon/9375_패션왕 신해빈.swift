var input = Int(readLine()!)!

//1. 테스트 케이스를 입력받아 반복한다.
for _ in 0..<input {
    var dict: [String: Int] = [:]
    
    
    //2. n을 입력받는다.
    input = Int(readLine()!)!
    for _ in 0..<input {
        
        //3. 이름과 종류를 입력받고, 종류를 key에 저장한다. 이름은 중복될 수 없으므로, 횟수를 저장한다.
        let data = readLine()!.split(separator: " ").map { String($0) }
        let key = data[1]
        if dict.keys.contains(key) {
            dict[key]! += 1
        } else {
            dict[key] = 1
        }
    }
    
    //4. 딕셔너리의 종류들 간 조합의 수를 계산하고 1을 빼서 출력한다 (알몸인 경우 제외)
    let result = dict.values.map { $0 + 1 }.reduce(1, *) - 1
    print(result)
}
    /*
     3 -> 1 : 3가지
     hat headgear
     sunglasses eyewear
     turban headgear
     
     headgear = [hat, turban] -> 3
     sunglasses = [eyewear] -> 2
     -> 6 - 1 = 5
     */
