//1. 문자열을 입력받는다. (인덱스로 조회할 수 없으니까 이 부분을 잘 짜야할 듯)
let string = readLine()!

//2. 결과를 우선 1로 두고, 만약 다른 경우 0으로 바꾼 후 리턴시키자.
var result = 1

//3. 문자열의 길이 / 2를 계산하여 반복문을 돌린다.
let count = string.count

//4. i와 n-i가 동일한지 확인한다.
for i in 0..<count/2 {
    let leading = string.index(string.startIndex, offsetBy: i)
    let trailing = string.index(string.startIndex, offsetBy: count - i - 1)
    
    if string[leading] != string[trailing] {
        result = 0
        break
    }
}

//5. 반복문이 무사 종료되었다면 1, 아니라면 0을 출력한다.
print(result)
