# Dynamic Programming

## DP를 사용할 수 있는 조건

1. Problem이 더 작은 SubProblem으로 쪼개질 수 있어야한다.
2. SubProblem으로 결과를 도출할 수 있어야한다.
3. 중복된 SubProblem이 겹쳐야한다.

### 예시) Fibonacci numbers

피보나치 수열 $$F(n) = F(n-1) + F(n-2)$$

![](<../.gitbook/assets/image (2).png>)<img src="../.gitbook/assets/image (5).png" alt="" data-size="original">

#### 재귀함수를 이용한 피보나치 구현

```swift
func fibonacci(_ n: Int) -> Int {
    if [0, 1].contains(n) {
        return n
    }
    
    return fibonacci(n - 1) + fibonacci(n - 2)
}

print(fibonacci(10))
```

#### Top down 방식의 DP

{% hint style="info" %}
주어진 n을 구하기 위해 n부터 n-1, n-2.. 를 호출하며 값을 계산한다.

sub problem에 대한 중복 계산은 일어나지 않지만, 함수 stack이 많이 쌓이게 된다.
{% endhint %}

```swift
var fiboArray = [0, 1]
func fibonacci(_ n: Int) -> Int {
    if fiboArray.count > n {
        return fiboArray[n]
    }
    let fibo = fibonacci(n-1) + fibonacci(n-2)
    fiboArray.append(fibo)
    return fibo
}

print(fibonacci(10))
```

#### Bottom up 방식의 DP

{% hint style="info" %}
주어진 n을 구하기 위해 0부터 n까지 배열을 쌓아나간다.

공간 복잡도가 O(n), 시간복잡도 O(n)으로 표현할 수 있다.
{% endhint %}

```swift
func fibonacci(_ n: Int) -> Int {
    if [0, 1].contains(n) {
        return n
    }
    var fiboArray = [0, 1]
    for i in 2...n {
        fiboArray.append(fiboArray[i-1] + fiboArray[i-2])
    }
    return fiboArray[n]
}

print(fibonacci(10))
```
