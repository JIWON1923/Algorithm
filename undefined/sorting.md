---
description: 정렬 알고리즘 개념 정리
---

# Sorting

## 전체 요약

1. 단순하지만, 조금 느린 정렬&#x20;
   1. Bubble sort
   2. Insertion sort&#x20;
   3. Selection sort
2. 조금 복잡하지만, 빠른 정렬&#x20;
   1. Quick sort
   2. Merge sort
   3. Heap sort
3. 기타
   1. Radix sort&#x20;

## Selection Sort

### 알고리즘

1. 가장 작은 값을 찾는다.
2. 찾은 값을 배열의 맨 앞 요소와 교체한다.&#x20;
3. 정렬을 수행한 요소를 제외하고, 1번 2번 과정을 모두 반복한다.

### 특징

* 최악, 최선, 평균의 시간복잡도가 다르지 않다.&#x20;
* 데이터 요소에 관계 없이 모든 원소에 대해 비교 연산을 수행하기 때문이다.
* 시간복잡도는 $$O(n^2)$$
  * 1번 과정에서 for loop가 n-1회 반복한다.
  * 2번 과정에서 가장 작은 수를 찾기 위해 남은 원소과 비교한다 : n-1, n-2...
  * 3번 과정의 교환은 상수 시간의 작업이다.
  * $$T(n) = (n-1) + (n-2) + ... + 2 + 1 = \frac{n(n+1)}{2} = O(n^2)$$

### 코드

```swift
func selectionSort(_ array: inout [Int]) {
    for current in 0 ..< array.count - 1 {
        var minIndex = current
        for index in current+1 ..< array.count {
            if array[index] < array[minIndex] {
                minIndex = index
            }
        }
        array.swapAt(minIndex, current)
    }
}

var array = [10, 2, 33, 20, 7]
selectionSort(&array)
print(array)
```

