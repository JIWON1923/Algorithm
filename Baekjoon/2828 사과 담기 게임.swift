//1. n, m을 입력받는다. (N: 스크린 크기, m: 바구니 크기)
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

//2. 사과의 개수 j를 입력받는다.
let j = Int(readLine()!)!

var start = 0
var result = 0

//3. 계산한다.
for _ in 0..<j {
    let apple = Int(readLine()!)!
    if start < apple && apple <= start + m { // 바구니 범위 안에 존재
        continue
    } else if apple > start + m {
        //바구니의위치보다 사과 위치가 오른쪽에 있다면, 오른쪽으로 이동시킨다.
        result += apple - (start + m)
        start = apple - m
    } else  {
        //사과 위치가 왼쪽에 있다면 왼쪽으로 이동시킨다.
        result += (start + 1) - apple
        start = apple - 1
    }
}
//4. 이동거리를 출력한다.
print(result)
