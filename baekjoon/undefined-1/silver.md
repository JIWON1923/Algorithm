---
description: 완전탐색 Silver 등급 문제 해설
---

# 🥈 Silver



## 1018 체스판 다시 칠하기

[문제로 이동](https://www.acmicpc.net/problem/1018)

#### 문제 요약

M\*N크기의 보드를 8\*8 크기로 잘라 체스판처럼 페인트를 칠할 것이다. 이때, 칠해야하는 정사각형의 최소 개수를 구하는 문제이다.

#### 알고리즘

1. 체스판의 기준이 되는 Character 배열을 만든다.
2.  board라는 배열에 입력된 보드와 체스판이 다르다면 1, 같다면 0을 저장한다.

    이때, 단순히 0과 1을 저장하는 것이 아닌 누적합을 계산하여 저장한다.
3. board를 모두 채운 후, 각 배열 맨 앞에 0을 더한다. (누적합 계산을 편하게 하기 위해서)
4. board를 8\*8로 자른 후, 칠해야하는 정사각형의 개수를 구한다.
5. 계산한 값과 그 64에서 계산 값을 뺀다. (WB부터 시작하는지 BW부터 시작하는지를 계산하기 위해서)
6. 제일 작은 값을 출력한다.

#### 접근방법

* 처음에는 board1과 board2로 만들어서 BW로 시작하는 경우와 WB로 시작하는 경우를 나눠야되지 않을까? 생각했다.
* 하지만 체스판의 크기는 64로 고정된 값이기 때문에, 다시 64에서 WB로 시작하는 값을 빼주면 BW로 시작했을 때의 결과를 얻을 수 있다.

#### 코드

```swift
let input = readLine()!.split { $0 == " " }.map { Int($0)! }, (n, m) = (input[0], input[1])
let chess1 = String(repeating: "WB", count: 25).map { $0 }
let chess2 = String(repeating: "BW", count: 25).map { $0 }
var board = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var result = Int.max

for i in 0 ..< n {
    let input = readLine()!.map { $0 }
    if i % 2 == 0 {
        for j in 0 ..< m {
            let prev = j == 0 ? 0 : board[i][j-1]
            if String(input[j]) != String(chess1[j]) {
                board[i][j] = prev + 1
            } else {
                board[i][j] = prev
            }
        }
    } else {
        for j in 0 ..< m {
            let prev = j == 0 ? 0 : board[i][j-1]
            if String(input[j]) != String(chess2[j]) {
                board[i][j] = prev + 1
            } else {
                board[i][j] = prev
            }
        }
    }
    board[i].insert(0, at: 0)
}


for h in 0 ... n - 8 {
    for w in 0 ... m - 8 {
        var temp = 0
        for i in 0 ..< 8 {
            temp += board[h+i][w+8] - board[h+i][w]
        }
        temp = min(temp, 64 - temp)
        result = min(result, temp)
    }
}
print(result)
```

## 1065 한수

[문제로 이동](https://www.acmicpc.net/problem/1065)

#### 문제 요약

정수 n에 대하여, 각 자리수가 등차수열을 이룬다면, 한수라고 말한다. 1000 이하의 정수 n이 주어졌을 때, N이하의 자연수 중 한수의 개수를 구하는 프로그램을 작성해라.

#### 알고리즘

1. N이 2자리수라면, n을 출력한다. (2자리수는 무조건 등차수열이다)
2. 100부터는 각 자리수가 등차수열을 이루는지 확인 후 count에 추가한다.

#### 접근방법

* 다른 사람의 코드를 참고하여 작성했다. ( 두 자리 수가 무조건 등차수열이라는 것을 인식하지 못했다 ㅠ)

#### 코드

```swift
let n = Int(readLine()!)!
print(getHansu(n))

func getHansu(_ n: Int) -> Int {
    // 2자리수는 무조건 등차수열이다.
    var count = min(99, n)
    
    if n > 99 {
        for i in 100...n {
            // 한수의 개수를 센다.
            count += isHansu(String(i).map { $0 }) ? 1 : 0
        }
    }
    return count
}

func isHansu(_ n: [Character]) -> Bool {
    let d = Int(String(n[0]))! - Int(String(n[1]))!
    // 다음 원소와 비교했을 때, 등차수열을 이루지 않는다면 false를 리턴한다.
    for i in 1 ..< n.count-1 {
        guard Int(String(n[i]))! - Int(String(n[i+1]))! == d else { return false }
    }
    
    // 모든 원소가 등차수열을 이루었을 때 true를 리턴한다.
    return true
}
```

## 4673 셀프 넘버

[문제로 이동](https://www.acmicpc.net/problem/4673)

#### 문제 요약

양의 정수 n에 대해 $$d(n) = n + n (i)$$이다.

n이 51이라면 51 + 5 + 1 = 56이 된다. 이때 51은 56의 생성자라고 이야기할 수 있다.

자연수 n은 생성자 1개 이상 있을 수도, 없을 수도 있다. 생성자가 없는 수를 셀프넘버라고 부른다.

10000보다 작은 수 중 셀프넘버를 계산해서 출력해라.

#### 알고리즘

1. 10001개의 true 값을 가진 배열을 생성한다.
2. 1부터 10000까지 반복하며 각 i에 대해 d(n)을 생성한다.
3. d(n)이 10000이하일 때, 해당 인덱스 값을 false로 저장한다.
4. 배열의 값이 true인 경우, 인덱스를 출력한다.

#### 접근방법

* 수학적인 규칙이 있는지 계산해봤다.
  * 1부터 9까지 계산했을 때는 자기 자신의 2배가 d(n)이었다.
  * 하지만 10부터 20까지는 규칙을 찾을 수 없었다.
  * 이에 d(n)의 생성 규칙을 따를 수 밖에 없었다.
* 무식하게 풀 수 있는가를 생각해봤다.
  * 무식하게 푸는 경우 10,000번의 연산횟수, 출력을 위한 10,000개의 원소 조회로 시간초과 없이 문제를 해결할 수 있다.

#### 코드

```swift
var isSelfNumber = [Bool](repeating: true, count: 10001)

// 셀프넘버 계산
for i in 1 ... 10000 {
    let num = i + String(i).map { Int(String($0))! }.reduce(0, +)
    guard num <= 10000 else { continue }
    isSelfNumber[num] = false
}

// 셀프넘버 출력
for i in 1 ... 10000 {
    if isSelfNumber[i] { print(i) }
}

```
