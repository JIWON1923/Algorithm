//1. n, k를 입력받는다.
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (input[0], input[1] - 1) // k가 2라면, 자기 자신 + 1만큼만 더해야됌 즉, K-1

//2. 수열을 입력받는다. -> 헷갈려서 0번지는 비워두었음.
var temperature = [0]
temperature.append(contentsOf: readLine()!.split(separator: " ").map { Int($0)! })

//6. 가장 큰 값을 출력한다.
print(calcPrefix())

func calcPrefix() -> Int {
    
    //3. n == k라면 수열의 합을 출력한다.
    if n == k { return temperature.reduce(0, +) }
    
    // 4. 그렇지 않다면 누적합을 구해서 배열에 저장한다.
    var prefixArray = [Int](repeating: 0, count: n+1)
    for i in 1...n {
        prefixArray[i] = prefixArray[i-1] + temperature[i]
    }

    //5.  k를 기준으로 연속되는 날짜에 대한 정보를 저장한다.
    var information = [Int]()
    for i in 1...n-k {
        information.append(prefixArray[i+k] - prefixArray[i-1])
    }
    return information.max()!
}
