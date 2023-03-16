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
