---
description: 기초 수학 공식에 대한 알고리즘 구현
---

# 수학 공식

## 순열

{% hint style="info" %}
**순서가 정해진 임의의 집합**을 다른 순서로 엮는 연산이다.&#x20;

$$nPr = \frac {n!}{(n-r)!}$$

N개 중 R개를 뽑을 때 사용한다.
{% endhint %}

```swift
var v = [1, 2, 3]

func permutation(n: Int, r: Int, depth: Int) {
    if r == depth {
        print( v.map { String($0) }.joined(separator: " "))
        return
    }
    
    for i in depth..<n {
        v.swapAt(i, depth)
        permutation(n: n, r: r, depth: depth + 1)
        v.swapAt(i, depth)
    }
    return
}

permutation(n: 3, r: 3, depth: 0)
```

```swift
func permutation<T>(_ elements: [T], _ k: Int) -> [[T]] {
    var result = [[T]]()
    var visited = [Bool](repeating: false, count: elements.count)
    
    func permut(_ now: [T]) {
        if now.count == k {
            result.append(now)
            return
        }
        
        for i in 0..<elements.count {
            if visited[i] == true { continue }
            visited[i] = true
            permut(now + [elements[i]])
            visited[i] = false
        }
    }
    permut([])
    return result
}
```



## 조합

{% hint style="info" %}
**순서를 고려하지 않고**, 다양한 요소를 뽑을 때 사용한다.

$$nCr = \frac {n!}{r! (n-r)!}$$
{% endhint %}

### 재귀를 이용한 조합 구현

```swift
let n = 5, r = 3, a = [1, 2, 3, 4, 5]

func combi(start: Int, list: [Int]) {
    if list.count == r {
        print(list.map { String($0) }.joined(separator: " "))
        return
    }

    var tempList = list
    for i in start + 1 ..< n {
        tempList.append(i)
        combi(start: i, list: tempList)
        tempList.removeLast()
    }
    return
}

combi(start: -1, list: []) // for문이 start + 1부터 시작함!
```

```swift
func combination<T>(_ elements: [T], _ k: Int) -> [[T]] {
    var result = [[T]]()
    
    func combi(_ index: Int, _ now: [T]) {
        if now.count == k {
            result.append(now)
            return
        }
        for i in index..<elements.count {
            combi(i + 1, now + [elements[i]])
        }
    }
    combi(0, [])
    return result
}
```

### 반복을 이용한 조합 구현

```swift
let n = 5, r = 3, a = [1, 2, 3, 4, 5]

// r=3이므로 3중 for문 -> r이 작을 때에만 반복문을 사용하자
for i in 0..<n {
	for j in i+1 ..< i {
		for k in j+1 ..< j {
			print("\\(i), \\(j), \\(k)
		}
	}
}

// 순서만 다를 뿐
for i in 0..<n {
	for j in 0..<i {
		for k in 0..<j {
			print("\\(i), \\(j), \\(k)
		}
	}
}
```

## 최대공약수

{% hint style="info" %}
유클리드 호제법을 사용하여 구할 수 있다.

두 양의 정수 a, b(a >b)에 대하여 $$a = bq + r$$(0 <= r < b) 라 하면, a, b의 최대공약수는 b,r의 최대공약수이다.

gcd(a, b) = gcd(b, r)
{% endhint %}

```swift
func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a%b)
}
```

## 최소공배수

{% hint style="info" %}
최소 공배수 = a \* b / 최대공약수이다.

최대공약수 -> 유클리드 호제법을 통해 구할 수 있다.
{% endhint %}

```swift
func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a%b)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}
```

## 소수 찾기

{% hint style="info" %}
에라토스테네스의&#x20;
{% endhint %}

### 에라토스테네스의 체

&#x20;n이 1,000,000 이하일 때 사용하는 것이 좋다.

```swift
func primeNumbers(_ n: Int) -> [Int] {
  var numbers = [Bool](repeating: true, count: n+1)
  var result = [Int]()

  for i in 2...n {
      if numbers[i] {
          for j in stride(from: i*2, to: n, by: i) {
              numbers[j] = false
          }
      }
  }

  for i in 2...n {
      if numbers[i] { result.append(i) }
  }

  return result
}
```

```swift
func primeNumbers(_ n: Int) -> Set<Int> {
  var numbers = Set(2...n)

  for i in 2...n {
      if numbers.contains(i) {
          numbers.subtract(Set(stride(from: i*2, to: n, by: i)))
      }
  }
  return numbers
}
```

### 제곱근 사용

```swift
func isPrimeNumber(_ n: Int) -> Bool {
    if n < 2 { return false }
    if n == 2 { return true }
    if n % 2 == 0 { return false }
    
    for i in 2...n {
        **if !(i * i <= n) { break }**
        if n%i == 0 { return false }
    }
    
    return true
}
```

```swift
import Foundation

func isPrimeNumber(_ n: Int) -> Bool {
    if n < 4 { return n >= 2 }
    if n % 2 == 0 { return false }
    
    for i in 2...**Int(sqrt(Double(n))** {
        if n % i == 0 { return false }
    }
    return true
}
```

## n 팩토리얼

```swift
func factorial(_ n: Int) -> Int {
    var n = n
    var result = 1
    while n > 1 {
        result *= n
        n -= 1
    }
    return result
}
```
