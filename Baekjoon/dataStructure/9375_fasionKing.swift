for _ in 0..<Int(readLine()!)!{
    var result_arr: [Int] = []
    var dic = [String: [String]]()
    let n = Int(readLine()!)!
    if n == 0{
        print(0)
        continue
    }
    for _ in 0..<n{ // n만큼 반복
        let value: [String] = readLine()!.split(separator: " ").map{ String($0) }
        
        if dic.keys.contains(value[1]){
            dic[value[1]]!.append(value[0])
        } else {
            dic[value[1]] = [value[0]]
        }
    }
    for (_, value) in dic{
        result_arr.append(value.count + 1)
    }
    print(mul(numbers: result_arr) - 1)
    
}

func sum(numbers: [Int]) -> Int{
    numbers.reduce(0, +)
}

func mul(numbers: [Int]) -> Int{
    numbers.reduce(1, *)
}
