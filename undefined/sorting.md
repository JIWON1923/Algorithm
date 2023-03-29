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

## Insertion Sort

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



## Selection Sort

{% hint style="info" %}
배열에 원소를 하나씩 추가하며 해당 원소의 위치를 결정하는 알고리즘이다.

정렬된 K-1 개의 배열에 대해&#x20;
{% endhint %}

### 알고리즘

* 이 과정은 i 번째 원소를 삽입하기 위한 과정이라고 생각하자.

1. i 번째 원소를 임시 변수에 저장한다.
2. i-1 번째부터 1번째까지 반복하며, 자신보다 크기가 작은 원소가 나올 때 까지 반복하며 해당 원소의 위치를 찾아 저장한다.

### 특징

* for loop는 n-1 번 반복한다.
* 삽입의 경우, 최악의 경우 i-1 번 비교하게 된다.&#x20;
* 최악의 경우 시간복잡도는 $$O(n^2)$$
  * 역순으로 정렬되어있는 경우, 매번 i-1회 탐색해야한다.
* 최선의 경우 시간복잡도는 $$O(n)$$
  * 처음부터 배열이 정렬되어있는 경우, 1번의 비교로 해당 원소의 위치가 결정될 수 있다.

### 코드

```swift
var array = [10, 2, 33, 20, 7]
insertSort(&array)
print(array)

func insertSort(_ array: inout [Int]) {
    for i in 1 ..< array.count {
        for j in stride(from: i, to: 0, by: -1) {
            guard array[j] < array[j-1] else { continue }
            array.swapAt(j, j-1)
        }
    }
}
```

## Merge Sort

### 분할정복법

* merge sort와 quick sort에서 공통으로 사용되는 기법이다. (본질적으로 recursion을 사용한다)
* 3가지 단계로 거쳐러 문제를 해결하는 것&#x20;
  * 분할 : 해결하고자 하는 문제를 작은 크기의 **동일한 문제**들로  분할한다.&#x20;
  * 정복 : 각각의 작은 문제를 순환적으로 해결한다. (동일한 문제들로 분할되므로, 작은 문제를 해결하기 위해 특수한 알고리즘이 요구되지 않는다. 즉, 최종 문제 해결 알고리즘과 작은 문제 해결 알고리즘이 동일하다. )
  * 합병 : 작 문제의 해를 합하여 원래 문제에 대한 해를 구한다.

### 알고리즘

1. 데이터가 저장된 배열을 절반으로 나눈다.&#x20;
2.  각각을 순환적으로 정렬한다.

    길이가 1인 리스트로 나누어질 것이다.
3.  정렬된 두 개의 배열을 합쳐 전체를 정렬한다. (이 부분의 구현이 필요하다)

    길이가 1인 리스트를 합치는 과정에서 정렬을 수행해야한다.

### 특징

$$T(n)  = 0, (n==1일 때)$$

$$T(n) = T(n/2) + T(n/2) + n$$

* 반으로 나눈 리스트를 합칠 때 연산이 존재한다.
  * 리스트를 반으로 나누는 횟수 = log(N)이다. (트리의 높이 생각)
  * 합칠 때 n 만큼의 횟수가 소요된다.
  * 따라서 시간복잡도는 $$O(N) = NlogN$$

### 코드

```
mergeSort(A[], p, r) { // A[p...r]을 정렬한다.
    if (p < r) then {
        q <- (p+q)/2
        mergeSort(A, p, q)
        merge(A, p, q, r)
    }
}

merge(A[], p, q, r) {    
    정렬되어있는 두 배열 A[p...q], A[q+1...r]을 합하여
    정렬된 배열 A[p...r]을 만든다.
}
```

```swift
func mergesort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    let center = array.count / 2
    let left = Array(array[0..<center])
    let right = Array(array[center..<array.count])
    
    func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var left = left
        var right = right
        var result = [Int]()
        
        while !left.isEmpty && !right.isEmpty {
            if left[0] < right[0] {
                result.append(left.removeFirst())
            } else {
                result.append(right.removeFirst())
            }
        }
        
        return result + left + right
    }
    
    return merge(mergesort(left), mergesort(right))
}

```

```swift
func mergeSort(array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    let center = array.count / 2
    let leftArray = mergeSort(array: Array(array[0..<center]))
    let rightArray = mergeSort(array: Array(array[center..<array.count]))
    return merge(left: leftArray, right: rightArray)
}

func merge(left: [Int], right: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    var result = [Int]()
    
    while leftIndex < left.count, rightIndex < right.count {
        if left[leftIndex] < right[rightIndex] {
            result.append(left[leftIndex])
            leftIndex += 1
        } else {
            result.append(right[rightIndex])
            rightIndex += 1
        }
    }
    if leftIndex < left.count {
        result += Array(left[leftIndex ..< left.count])
    } else {
        result += Array(right[rightIndex ..< right.count])
    }
    return result
}
```

## Quick Sort

{% hint style="info" %}
분할 정복법을 사용한다. (데이터 분할 방법에서 Merge Sort와 차이가 있다.)

특정 값을 기준으로 분할한다. (최악의 경우 시간 복잡도는 동일하다)
{% endhint %}

### 특징

* Quick sort의 분할에서는 반으로 분리된다는 보장이 없다.
  * 최악의 경우는 pivot이 리스트에서 가장 큰 값이거나, 가장 작은 값인 경우이다.
* 분할 후 Pivot 앞에는 pivot보다 작고, 뒤는 크다.
* 분할 단계에서 정렬이 수행되기 때문에 합병 단계에서 특별한 알고리즘이 요구되지 않는다.



```
quicksort(A[], p, r) {
    if (p < r) then 
        q = partition(A, p, r) // 분할, q는 pivot의 위치
        quicksort(A, p, q-1)   // 왼쪽 부분 배열 정렬
        quicksort(A, q+1, r)   // 오른쪽 부분 배열 정렬
    }
}

partition(A[], p, r) {
    배열 A[p...r]의 원소들을 A[r]을 기준으로 양쪽으로 재배치하고,
    A[r]이 자리한 위치를 리턴한다.   // 피봇의 위치를 리턴한다.
}
```

```swift
func quickSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    var array = array
    let pivot = array.removeLast()
    
    let left = array.filter { $0 < pivot }
    let right = array.filter { $0 >= pivot }
    
    return quickSort(left) + [pivot] + quickSort(right)
}
```

## Heap Sort

{% hint style="info" %}
힙 정렬은 최대 힙이나 최소 힙을 구성하여 정렬하는 방법이다.

* 내림차순 정렬 : 최대힙
* 오름차순 정렬 : 최소 힙
{% endhint %}

### 알고리즘

1. 주어진 데이터를 heap으로 만든다.&#x20;
2. 힙에서 최댓값과 마지막 리프노드와 자리를 바꾼다.&#x20;
3. 힙의 크기가 1 줄어든 것으로 간주한다. (마지막 값은 힙의 일부가 아닌 것으로 간주한다. )
4. 루트노드에 대해서 Heapify(1)을 한다. (remove node 했을 때의 과정을 반복한다) &#x20;
5. 2번 \~ 4번 과정을 반복한다.

### 특징

* 최악의 경우 시간 복잡도 $$O(NlogN)$$
* sorts in place - 추가 배열이 필요하지 않다.
* 이진 힙 자료구조(binary heap)를 사용한다.
  * Heap 자료구조
    * complete binary tree이면서 ( -> 인덱스로 부모, 자식 관계를 표현할 수 있게 된다.)
    * Heap property를 만족해야한다. (부모와 자식 간 관계)
      * maxHeap : 부모는 자식보다 크거나 같다.
      * minHeap : 부모는 자식보다 작거나 같다.
    * 힙은 동일한 데이터라도, 삽입 순서에 따라 다양한 형태를 가질 수 있다.

### 코드

```
HEAPSORT(A)                     // O(NlogN)

BUILD-MAX-HEAP(A)               // O(n)
for i <- heapSize downto 2 do   // n-1 times
    exchange A[1] <-> A[i]      // O(1)
    heapSize <- heapSize - 1    // O(1) 
    MAX-HEAPFIY(A, 1)           // O(logN)
```

```swift
func heapSort(_ array: [Int], _ reverse: Bool = false) -> [Int] {
    var array = array
    var result = [Int]()
    
    for i in stride(from: array.count - 1 , to: -1, by: -1) {
        if i == 0 {                           // 원소가 하나만 있을 때는 단순히 추가해주면 된다.
            result.append(array.removeLast())
        } else {                              // 남은 원소가 여러개라면, 남은 리스트를 기준으로 힙을 만든다.
            array = buildMaxHeap(array)
            array.swapAt(i, 0)                // 리프노드를 맨 앞으로 가져온다.
            result.append(array.removeLast()) // 루트 노드를 제거한 후 결과 리스트에 추가한다.
        }
    }
     
     if !reverse { // 정렬 기준 선택
        result.reverse()
    }
    
    return result
}

func buildMaxHeap(_ array: [Int]) -> [Int] {
    var array = array                            // 정렬되지 않은 리스트
    
    for i in 1 ..< array.count {                 // 1번부터 마지막 노드까지 조회
        var childNode = i
        while childNode != 0 {                   // i번째 노드의 위치를 지정한다.
            let parent = childNode / 2
            if array[childNode] > array[parent] {
                array.swapAt(childNode, parent)
            }
            childNode = parent
        }
    }
    return array
}

```



## 참고한 글 및 강의

\[1] [권오흠 교수님의 기본 정렬 알고리즘 강의](https://www.youtube.com/watch?v=0dG7xTt5IfQ)

\[2] 권오흠 교수님의 합병 정렬 알고리즘 강의

\[3] 권오흠 교수님의 빠른 정렬 알고리즘 강의

\[4] [개발자 소돌이님의 알고리즘 포스팅](https://babbab2.tistory.com/101)

\[5] [Dev Pingu님의 힙 정렬 알고리즘 포스팅](https://icksw.tistory.com/91)
