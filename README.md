# Algorithm

- 문제 제목을 클릭하면, GitHub 코드로, ✏️를 클릭하면 티스토리로 이동합니다.
- 코딩테스트 연습 (백준, 프로그래머스 등)
[알고리즘](#알고리즘)
[자료구조](#자료구조)

# 알고리즘

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

