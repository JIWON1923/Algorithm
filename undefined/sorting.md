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

## Bubble Sort

{% hint style="info" %}
제일 큰 값의 원소를 찾아 위치를 결정한 후 다음 원소를 탐색한다는 점에서 Selection Sort와 비슷하다.

하지만 최댓값을 찾고, 마지막 위치로 가져오는 방법에서 차이가 존재한다.&#x20;
{% endhint %}

### 알고리즘

1. 첫번째 인덱스부터 다음 인덱스와의 값을 비교한다.
2. 만약, 다음 인덱스에 저장된 값보다, 현재 인덱스 값이 더 크다면, 자리를 교환한다.
3. 마지막 원소까지 비교가 끝난다면, 제일 마지막 원소에는 배열 중 가장 큰 값이 저장되어 있을 것이다.
4. 해당 과정을 모든 배열이 정렬될 때까지 반복한다.&#x20;

### 특징

* 삽입 정렬과 마찬가지로 최악, 최선, 평균 시간복잡도가 동일하다.&#x20;
* 데이터의 요소와 상관 없이 모든 원소에 대해 비교 연산을 수행하기 때문이다.
* 시간복잡도 = $$O(n^2)$$
  * 첫 번째 for loop에서 n-1번의 반복을 통해 각각의 위치를 찾아나간다.
  * 두 번째 for loop에서 index에 대해 각 인접 요소를 탐색하게 된다. (n-1, n-2, ..1)
  * 교환 연산은 상수 시간이 소요된다.
  * $$T(n) = (n-1) + (n-2) + ... + 2 + 1 = \frac{n(n+1)}{2} = O(n^2)$$

### 코드

```swift
func bubbleSort(_ array: inout [Int]) {
    for i in 0 ..< array.count {
        var isSwap = false
        for j in 0 ..< array.count - i - 1 {
            if array[j] > array[j+1] {
                array.swapAt(j, j+1)
                isSwap = true
            }
        }
        // 현재 반복문에서 한 번도 swap이 나타나지 않았다면, 이미 모두 정렬된 것이다.
        guard isSwap else { return }
    }
}

var array = [10, 2, 33, 20, 7]
bubbleSort(&array)
print(array)
```
