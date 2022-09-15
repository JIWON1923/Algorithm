// 정수 n을 입력받아 n의 약수를 모두 더한 값을 리턴하는 함수, solution을 완성해주세요.

func solution(_ n:Int) -> Int {

    if n <= 1 { return n }
    var result: Set<Int> = []
    Array<Int>(1...n/2).forEach {
        if n % $0 == 0 {
            result.insert($0)
            result.insert(n/$0)
        }
    }
    return result.reduce(0){ $0 + $1 }
}
