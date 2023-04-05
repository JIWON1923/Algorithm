# 🍼 \[누적 합] Silver

## 11659 구간 합 구하기 4

[문제로 이동 ](https://www.acmicpc.net/problem/11659)

#### 문제 요약

배열이 주어질 때, i 번째 수 부터 j 번째 수 까지의 합을 구해라.

#### 알고리즘

1. 배열을 입력받는다.
2. 누적합 배열을 만든다.
3. 입력받은 값을 기반으로 결과를 출력한다.

#### 접근방법

* 누적합 계산을 쉽게 하기 위해서 초기 값에는 0을 대입한다.
* 즉, presum\[1]번째에 numbers\[0]이 저장된다.
  * append(presum\[i] + numbers\[i]) 라고 한다면, i-1번째까지의 합 + 현재 numbers\[i]에 대해 접근하게 되는것!
* 이후 입력받은 i 와 j 에 대해서 값을 계산해주면 된다.

#### 코드

```swift
let input = readLine()!.split { $0 == " " }.map { Int($0)! }, (n, m) = (input[0], input[1])
let numbers = readLine()!.split { $0 == " " }.map { Int($0)! }
var presum = [0]

for i in 0 ..< n {
    presum.append(presum[i] + numbers[i])
}

for _ in 0 ..< m {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    let (i, j) = (input[0], input[1])
    print(presum[j] - presum[i-1])
}
```
