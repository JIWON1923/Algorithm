# 탐색 알고리즘

## 이진탐색

### 반복문을 이용한 코드

```swift
func binarySearch(_ array: [Int], _ data: Int) -> Bool {
    var start = 0, end = array.count - 1

    while start <= end {
        let mid = (start + end) / 2
        if array[mid] == data {
            return true
        } else if array[mid] > data {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return false
}


print(binarySearch([1, 3, 5, 2, 3, 5, 3], 3))
print(binarySearch([1, 3, 5, 2, 3, 5, 3], 7))
```

### 재귀를 이용한 코드

```swift
func binarySearch(_ array: [Int], _ data: Int) -> Bool {
    guard !array.isEmpty else { return false }
    guard array.count > 1 else { return array[0] == data }
    
    let mid = array.count / 2
    guard array[mid] != data else { return true }
    
    let range = array[mid] > data ? 0..<mid : mid+1 ..< array.count
    return binarySearch(Array(array[range]), data)
}

print(binarySearch([1, 3, 5, 2, 3, 5, 3], 3))
print(binarySearch([1, 3, 5, 2, 3, 5, 3], 7))

```
