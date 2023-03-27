# 🥈 \[DP] Silver

## 1463 1로 만들기

[문제로 이동](https://www.acmicpc.net/problem/1463)

#### 문제 요약

정수 x에 대해 세 가지 연산을 할 수 있다. 연산을 반복하며 x를 1로 만들고자 할 때, 최소한의 연산 횟수를 구해라.

* 3으로 나누어 떨어진다면, 3으로 나눈다.
* 2로 나누어 떨어진다면, 2로 나눈다
* 1을 뺀다.

#### 알고리즘

점화식은 다음과 같다.$$F(n) = min(F(n/3), F(n/2), F(1)) + 1$$

해당 점화식을 사용하여 Bottom up 방식으로 코드를 구현한다.

#### 접근 방법

* 그리디는 왜 안 될까?
* 무조건 나눗셈이 숫자가 더 빨리 줄어들기 때문에 그리디를 생각할 수 있지만, 최적회가 아니다.
  * 그리디 알고리즘은 3으로 나눔 -> 2로 나눔 -> 1로 뺌의 순서로 이루어 질 것이다.
  * 2n + 1을 생각해보자.
    * Greedy: 11 -> 10 -> 5 -> 4 -> 2 -> 1 (6회)
    * 최적해 : 11 -> 10 -> 9 -> 3 -> 1 (5회)
  * 간단한 예제로도 그리디가 최적해가 아님을 밝힐 수 있다.

#### 코드

```swift
var dp = [0, 0, 1, 1]
print(makeNumberOne(Int(readLine()!)!))

func makeNumberOne(_ n: Int) -> Int {
    guard n > 3 else { return dp[n] }
    
    for i in 4 ... n {
        dp.append(dp[i-1] + 1)
        
        if i % 3 == 0 { // 3으로 나누어 떨어진다면
            dp[i] = min(dp[i], dp[i/3] + 1)
        }
        if i % 2 == 0 { // 2로 나누어 떨어진다면
            dp[i] = min(dp[i], dp[i/2] + 1)
        }
    }
    return dp[n]
}


```

<details>

<summary>시간초과 발생 ( filter, sorted 사용) </summary>

```swift
var dp = [0, 0, 1, 1]
print(makeNumberOne(Int(readLine()!)!))

func makeNumberOne(_ n: Int) -> Int {
    guard n > 3 else { return dp[n] }
    
    for i in 4...n {
        var nexts = [Int](repeating: -1, count: 3)
        
        if i % 3 == 0 { nexts[0] = dp[i/3] }
        if i % 2 == 0 { nexts[1] = dp[i/2] }
        nexts[2] = dp[i-1]
        
        nexts = nexts.filter { $0 != -1 }
        
        dp.append(nexts.min()! + 1)
    }
    return dp[n]
}
```

</details>

## 2839 설탕배달

[문제로 이동](https://www.acmicpc.net/problem/2839)

#### 문제 요약

상근이는 정확히 Nkg의 설탕을 배달해야한다. 설탕은 3kg, 5kg의 봉지에 담겨있다. 이때 상근이가 Nkg의 설탕을 최소한의 봉지로 배달하려고 한다. 이때 최소 봉지 수를 계산해라. (정확히 Nkg으로 배달할 수 없을 때에는 -1를 출력한다.)

#### 알고리즘

1. 설탕 DP 배열을 선언한다.
2. 점화식 $$F(n) = min(F(n-3), F(n-5)) +1$$을 만족하는 F(n)을 계산하여 출력한다.

#### 접근방법

* 그리디로 안 되는 이유?
  * 처음에는 그리디로 충분히 접근 가능하다고 생각했다.
  * 거스름돈 문제처럼, 5키로 그램 봉지로 나누고, 나머지를 3키로 봉지에 담으면 되지 않나? 라고 생각했지만 아니다!
  * 그리디 접근 방식에 따르면, 가능한 만큼 5kg로 가져가고, 나머지를 3kg에 담아야한다.
  * 하지만 **5는 3의 배수가 아니다**. 이에 5를 사용하지 않으면 배달할 수 있지만, 그리디 접근 방법으로 인해 -1이 출력되는 경우가 생긴다.
    * 예시 1) 설탕 21kg
      * Greedy : 5kg 4개, 남은 설탕 1kg -> 배달 불가, -1 출력
      * 실제 정답 : 3kg 7개 -> 배달 가능, 7 출력
    * 예시 2) 설탕 11kg
      * Greedy: 5kg 1개, 남은 설탕 1kg -> 배달 불가, -1 출력
      * 실제 정답: 5kg 1개, 3kg 2개 -> 배달 가능, 3 출력
  * 따라서 이 문제는 그리디로 풀 수 없다.
* 점화식 세우는 방법
  * 설탕 11kg으로 생각하면 이렇게 생각할 수 있다.&#x20;
    * 설탕 6kg + 5kg = 11kg
    * 설탕 8kg + 3kg = 11kg&#x20;
  * 설탕 8kg을 만들 수 있는지 우선 고려하지 않고, 11kg를 만들 수 있는 경우의 수를 생각하면 된다. (3kg로 만들지 5kg으로 만들지)
  * 그리고 설탕 6kg으로 만드는게 더 빠른지, 8kg을 만드는게 더 빠른지 비교하는 것이다. 이후 설탕 봉지 5kg 또는 3kg을 더하면 된다. (+1이 들어가는 이유)
  * 그래서 이 점화식이 나오는 것이다. $$F(n) = min(F(n-3), F(n-5)) +1$$
    * F(11) = 최소(설탕 8kg 경우의 수, 설탕 6kg 경우의 수) + 1
    * 여기서 주의할 점은 F(x)가 -1인 경우는 유효하지 않은 값임을 인지하고 있어야한다.

#### 코드

<pre class="language-swift"><code class="lang-swift"><strong>// 설탕 배열 설정
</strong><strong>var sugarDP = [-1, -1, -1, 1, -1, 1]
</strong>var sugar = Int(readLine()!)!
print(getSugar(sugar))

func getSugar(_ n: Int) -> Int {
    // n이 5일 때 까지는 선언된 설탕 배열을 출력한다.
    guard n > 5 else { return sugarDP[n] }
    
    // Bottom UP 방식의 DP
    for i in 6...n {
        let prev1 = sugarDP[i-3]
        let prev2 = sugarDP[i-5]
        
        // -1은 유효하지 않은 값이므로 제거 후 정렬한다.
        let temp = [prev1, prev2].filter { $0 != -1 }.sorted()
        
        // prev1과 prev2가 모두 -1이었다면, -1을 추가한다.
        guard !temp.isEmpty else {
            sugarDP.append(-1)
            continue
        }
        
        // prev1, prev2 중 작은 값에 1을 더해 i를 계산한다.
        sugarDP.append(temp[0] + 1)
    }
    return sugarDP[n]
}
</code></pre>

<details>

<summary>그리디 접근 방식 (틀린 방법)</summary>

```swift
var sugar = Int(readLine()!)!
var result = 0

for x in [3, 5] {
    if sugar >= x {
        result += sugar / x
        sugar %= x
    }
}
print( sugar == 0 ? result : -1)
```

</details>



## 9095 1, 2, 3 더하기

[문제로 이동](https://www.acmicpc.net/problem/9095)

#### 문제 요약

정수 n이 주어졌을 때, 1, 2, 3의 합으로 나타낼 수 있는 경우의 수를 계산해라.

n = 3이라면 (1+1+1, 1+2, 2+1, 3) 4가지로 표현할 수 있다.



#### 접근방법

* 사실 규칙을 생각하기 전에 점화식이 떠올랐다. (얻어 걸렸다는 말)
* 점화식 $$F(n) = F(n-1) + F(n-2) + F(n-3)$$
  * 이게 왜 맞지? 라는 생각을 했는데 F(1)의 1이 의미하는 바가 최댓값이 1이라고 생각하면 쉽게 이해할 수 있다.
  * F(4) = F(3) + F(2) + F(1) 이다.
    * F(1)에서 3을 더하면 4, F(2)에서 2를 더하면 4, F(3)에서 1을 더하면 4가 된다.
  * 마찬가지로 F(7) = F(6) + F(5) + F(4)
    * F(6)에서 1을 더하면 7, F(5)에서 2를 더하면, F(4)에서 3을 더하면 7이 된다.
* 경우의 수와 연산을 헷갈리지 말자!!

![](<../../.gitbook/assets/image (3).png>)![](<../../.gitbook/assets/image (1) (2).png>)

#### 코드

```swift
var dp = [0, 1, 2, 4]

// 점화식을 코드로 표현한다.
for i in 4...11 {
    dp.append(dp[i-1] + dp[i-2] + dp[i-3])
}

// 결과를 출력한다.
let testCase = Int(readLine()!)!
for _ in 0 ..< testCase {
    print(dp[Int(readLine()!)!])
}

```
