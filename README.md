# Algorithm

- 문제 제목을 클릭하면, GitHub 코드로, ✏️를 클릭하면 티스토리로 이동합니다.
- 코딩테스트 연습 (백준, 프로그래머스 등)
[알고리즘](#알고리즘)
- [수학](#수학)
    - 순열 (nPr)

[자료구조](#자료구조)
- [Stack](#stack)


# 알고리즘
## 수학

### 순열
- 순서가 있는 임의의 집합, n개 중 r개를 뽑는 방법


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

### 조합
- 순서가 없는 임의의 집합, n개 중 r개를 뽑는 방법

1. 재귀함수 이용


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

2. 반복문 사용

```swift
let n = 5, r = 3, a = [1, 2, 3, 4, 5]

// r=3이므로 3중 for문 -> r이 작을 때에만 반복문을 사용하자
for i in 0..<n {
    for j in i+1 ..< i {
        for k in j+1 ..< j {
            print("\(i), \(j), \(k)
        }
    }
}

// 순서만 다를 뿐
for i in 0..<n {
    for j in 0..<i {
        for k in 0..<j {
            print("\(i), \(j), \(k)
        }
    }
}
```

### 최대공약수
- 유클리드 호제법 이용

```swift
func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a%b)
}
```

### 최소공배수

```swift
func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a%b)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}
```

### 소수 찾기
1. 에라토스테네스의 체(n <= 1,000,000)

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

2. 제곱근 활용

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
**import Foundation**

func isPrimeNumber(_ n: Int) -> Bool {
    if n < 4 { return n >= 2 }
    if n % 2 == 0 { return false }
    
    for i in 2...**Int(sqrt(Double(n)))** {
        if n % i == 0 { return false }
    }
    return true
}
```

### 누적합

```swift
var cards = [0]
var prefix = [0]
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
cards.append(contentsOf: readLine()!.split(separator: " ").map { Int($0)! })

for i in 1...n {
    prefix.append(cards[i] + **prefix[i-1]**)
}

for _ in 1...m {
    let index = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (index[0], index[1])
    print(prefix[b] - prefix[a-1])
}
```

- Swift의 내장함수


```swift
print([1, 2, 3, 4, 5, 6].prefix(3))
```



# 자료구조
## Stack
- Swift의 배열 자체를 Stack처럼 사용하는 것이 베스트인듯! (굳이 만들 필요 없을 것 같다.)
- 삽입 삭제 모두 O(1)

``` swift
struct Stack<T> {
    private var stack: [T] = []
    
    var count: Int {
        stack.count
    }
    
    var isEmpty: Bool {
        stack.isEmpty
    }
    
    var peek: T? {
        stack.last
    }
    
    mutating func push(_ element: T) {
        stack.append(element)
    }
    
    mutating func pop() -> T? {
        stack.popLast()
    }
}
```


