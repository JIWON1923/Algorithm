---
description: 완전탐색 Bronze 단계 문제 해설
---

# 🥉 Bronze

## 2231 분해합

[문제로 이동](https://www.acmicpc.net/problem/2231)

#### 문제 요약

자연수 N의 분해합은 N + 각 자리수의 합이다.

예를 들어, 245의 분해합은 245 + 2 + 4 + 5 = 256이 된다. 이때, 245는 256의 생성자라고 부른다.

특정 자연수 N에 대해 생성자는 없을 수도 있고, 여러 개가 존재할 수도 있다.

자연수 N이 주어질 때, 가장 작은 생성자를 구해야한다.

#### 알고리즘

1. while문을 이용하여 각 자연수의 분해합을 계산한다.
2. 만약 해당 자연수가 입력된 N과 같다면 해당 값이 가장 작은 생성자가 된다.

#### 접근방법

* 수학적으로 계산할 방법이 떠오르지 않았다.
* N의 범위를 보았을 때, N의 최댓값은 1,000,000이었고 무식한 방법으로 푼다면 O(N)으로 해결할 수 있다.
* 이에 그냥 무식한 방법으로 코드를 작성했다.

#### 코드

```swift
let n = Int(readLine()!)!
var m = 0
var result = 0
while n != m {
    // m을 Int 배열로 변환한 후 reduce를 이용해 자리수의 합을 계산한다. 
    let sum = m + String(m).map { Int(String($0))! }.reduce(0, +)
    
    // m이 n의 생성자라면, result에 저장한 후 종료한다.
    if sum == n {
        result = m
        break
    } else {
        m += 1
    }
}
print(result)

```



## 10448 유레카 이론

[문제로 이동](https://www.acmicpc.net/problem/10448)

#### 문제 요약

자연수 N에 대해 삼각수 $$Tn = 1 + 2 + 3 ... + n = n(n+1)/2$$ 공식이 성립된다.

모든 자연수가 최대 3개의 삼각함수의 합으로 표현될 수 있다구 증명하였는데, 몇 자연수는 정확히 3개의 삼각함수로 표현될 수 없다.

정수가 주어졌을 때, 삼각수인지 판별할 수 있는 프로그램을 작성해야한다.

#### 알고리즘

1. 삼각수가 모여있는 집합을 만든다.
2. 삼각수 집합을 이용하여 순서 없이 중복 허용된 요소 3개를 뽑아 더한다.
3. 해당 자연수는 3개로 표현할 수 있는 자연수이다. 이를 result 배열에 1로 저장한다.
4.  입력받은 정수를 x라 할 때, result\[x]를 출력한다.

    result 배열에는 유레카 정수인 경우만 1로 저장돼있다.

#### 접근방법

1. 수학적 공식을 이용하여 풀 수 있는 규칙을 찾지 못했다.
2. 무식하게 풀 수 있는지 생각해보았다.
3.  삼각수를 찾고, 3개의 원소를 뽑는 경우의 시간 복잡도를 구해보자.

    N은 최대 1000이므로, 삼각수를 구하는데에 최대 1000 이하가 소요된다. (실제로는 46)

    중복 허용으로 3개를 뽑는 경우는 44  \* 43 \* 42 / 3이므로, 26,000로 무식하게 풀 수 있었다.

#### 코드

```swift
let test = Int(readLine()!)!
var triangleNumbers = [1]
var result = [Int](repeating: 0, count: 1001)

var num = 1, count = 2

// 삼각수 구하기
while num <= 1000 {
    num += count
    triangleNumbers.append(num)
    count += 1
}

let length = triangleNumbers.count
// 중복 허용 3개의 요소 뽑기
for i in 0 ..< length {
    for j in i ..< length {
        for k in j ..< length {
            let number = triangleNumbers[i] + triangleNumbers[j] + triangleNumbers[k]
            guard number <= 1000 else { continue }
            result[number] = 1
        }
    }
}

// 결과 출력
for _ in 0 ..< test {
    print(result[Int(readLine()!)!])
}

```
