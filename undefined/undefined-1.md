---
description: 그래프의 기본 개념과 탐색 방법
---

# 그래프 탐색

## 그래프 개념

### 정점과 간선

* 정점 (vertex)
  * 노드라고 불리며 그래프를 형성하는 기본 단위이다.
  * 분할할 수 없는 객체이자, 점으로 표현되는 점, 위치, 사람 등이 될 수 있다.
* 간선 (Edge)
  * 정점을 잇는 선으로, 관계 경로 등이 될 수 있다.
  * 간선에 방향에 따라 단방향간선, 양방향 간선으로 구분할 수 있다.
* 그래프 (Graph)
  * 정점과 간선의 집합

### indegree와 outdegree

* indgree : 정점으로 들어오는 간선
* outdegree : 정점으로 나가는 간선
* 보통 정점은 약자로 V 또는 U라고 표시하며 U(From)로부터 V(To)로 간다고 표현한다.

### 가중치

* 노드에서 다른 노드까지의 비용으로, 간선 비용의 합이다.

## 트리

{% hint style="info" %}
자식 노드와 부모 노드로 이루어진 계층으로, **무방향 그래프**이며 **사이클이 없다**
{% endhint %}

### 특징

* 그래프(정점과 간선의 집합)의 일종이다.
* 부모, 자식 **계층 구조**를 가진다.
* **`V-1 = E`**라는 특징이 있다.
  * 정점 : Vertex
  * 간선 : Edge
  * 간선 수 = 노드 수 - 1
* 임의의 두 노드 사이의 경로는 **유일무이하게 존재**한다.
  * 즉, 트리 내 특정 노드까지의 경로는 반드시 존재하며, 하나만 존재한다.
* 루트, 내부, 리프노드로 구성된다.

### 트리의 높이와 레벨

* 트리의 높이
  * 루트노드부터 최하단 리프노드까지의 길이
* 서브트리
  * 트리 내에 있는 트리 (부분 집합)
* 깊이
  * 각 노드마다 다르며, 루트 노드에서 특정 노드까지 **최단 거리로 갔을 때의 거리**
* 레벨
  * 보통 깊이와 같은 의미를 지닌다.
  * 루트노드의 시작 레벨에 따라 상대적으로 결정된다.
    * 1번 노드가 0레벨이라면, 2번노드는 1
    * 1번 노드가 1레벨이라면, 2번노드는 2
* 숲
  * 트리로 이루어진 집합

### 이진트리와 이진탐색트리

### 이진트리 (BT, BinaryTree)

* 각 노드의 **자식 노드 수가 2개 이하**로 구성되어있는 트리이다.
  * 정이진 트리(full binary tree) : 자식노드가 0개 또는 2개
  * 완전 이진 트리 (complete binary tree) : 왼쪽부터 채워져있는 트리로, 마지막 레벨을 제외하고는 완전히 채워져있으며, 마지막 레벨은 왼쪽부터 채워진다.
  * 변질 이진 트리 (degenerate binary tree) : 자식 노드가 하나밖에 없는 이진 트리
  * 포화 이진 트리 (Perfect binary tree) : 모든 노드가 가득 차 있는 이진트리
  * **균형 이진 트리** (balanced binary tree) : 모든 노드의 **왼쪽 하위 트리와 오른쪽 하위 트리의 차이가 1 이하인 트리**이다. Map, set을 구성하는 레드블랙트리는 균형 이진트리 중 하나이다.

### 이진 탐색 트리 (BST, Binary Search Tree)

* 이진 트리의 일종으로, 오른쪽 하위 트리에는 노드의 값보다 큰 값이 있는 노드만 포함되고, 왼쪽 하위트리에는 노드의 값보다 작은 값이 들어있는 트리이다.
* **검색에 유리**하다.&#x20;
  *   10을 찾는 과정에서 25보다 10이 작으므로, 왼쪽 노드를 탐색한다.&#x20;

      → 20보다 작으므로 왼쪽 노드로 탐색한다 → 10을 찾을 수 있다.
  * Up and down도 binary search tree에 들어간다.
* 이진탐색트리의 시간복잡도
  * 위 사진처럼 균형잡히게 분포되었다면 탐색, 삽입, 삭제, 수정 모두 O(logN)이다.
* 이진 탐색 트리의 모양은 노드 삽입 순서에 따라 달라진다. 1, 2, 3 순서로 삽입이 된다면 선형적 자료구조가 된다.
  * 이런 모양이 된다면, 탐색에 최악의 경우 O(logN)이 아닌 O(N)이 된다.
* 삽입 순서에 상관 없이 트리의 노드를 회전시키는 방법 등을 통해 균형 잡게 만드는 것을 **AVL 트리, 레드블랙트**리가 있다.
  * map 자료구조는, 삽입 탐색 삭제 수정의 시간복잡도가 O(logN)임을 보장받는데, 그 이유가 균형잡힌 트리인 레드블랙트리를 기반으로 구현되어있기 때문이다.

## 그래프 구현과 탐색

{% hint style="info" %}
그래프를 컴퓨터가 이해할 수 있도록 코드로 작성해야한다.
{% endhint %}

### 인접행렬

* 정점과 간선의 관계를 나타내는 2차원 행렬
* true, false를 이용하여 연결되어있는지 표현한다.

### 인접리스트 (adjancency list)

* 연결리스트럴 여러개 만들어 표현하는 방법이다.
* 각 정점마다 연결리스트를 만들고, 연결된 정점을 저장한다.

### 인접행렬과 인접리스트의 차이

1. 공간복잡도
   * 인접행렬 : O(V^2)
   * 인접리스트 : O(V + E)
     * 연결된 정점만 데이터가 들어간다.
     * 정점이 여러개가 있더라도 연결된 정점만 들어가므로, 간선의 개수만 들어가게 되는것이다
2. (최악) 시간복잡도
   1. 간선 한 개 찾기
      *   노드 i에서 노드 j로 가는 간선이 있는가?

          * 인접행렬 = O(1)
          * 인접리스트 = O(V)

          ```swift
          // 인접행렬
          if a[i][j]

          // 인접리스트
          if adj.values.contains(j)
          ```
   2. 모든 간선 찾기
      * 인접행렬 : O(V^2)
      * 인접리스트 : O(V + E)
3. 그래서 언제 인접 리스트, 인접 행렬을 써야할까?
   * 그래프가 희소한 경우(sparse) 인접리스트, 조밀할 때(dense)에는 인접 행렬을 쓴다.
   * 연결된 정점이 많이 없을 때에는 인접 리스트를 쓰는 것이 더 빠르고 좋다.
     * 인접행렬의 경우 무식하게 이차원 배열을 만들게 된다.
     * 연결되지 않은 노드들을 위해서도 이차원 배열을 만들게 된다.
   * 그래프가 조밀할 때 (간선이 너무 많을 때) 인접 행렬이 더 좋다.
     * 어차피 노드들이 모두 연결되어있다면 메모리적 효율성이 동일하므로, 하나의 간선을 찾는데에 속도가 더 빠른 인접 행렬이 더 빠르다.
   * 보통 코딩테스트에는 희소한 그래프가 나오니 연결리스트로 사용하는게 좋지만, 인접행렬로 주어진다면 주어진대로 문제를 푸는 것이 좋다.

### 연결된 컴포넌트(Connected component)

* 그래프 안에 하위그래프를 말하며, 하나의 덩어리라고 볼 수 있다.
* 연결된 컴포넌트에 속한 **모든 정점을 연결하는 경로**가 있다는 특징이 있다.
* 컴포넌트들에 번호를 붙여가며 색칠하는 알고리즘을 **풀르드필(floodfill)**이라고 한다.
  * 첫번재 연결된 컴포넌트에서 연결된 모든 노드는 1번
  * 두 번째 연결된 컴포넌트에서 연결된 모든 노드는 2번 이런 식으로
  * 해당 번호는 연결된 덩어리의 개수만큼만 나온다.
* 만약 맵으로 주어지는 상황에서도 갈 수 있는 지점을 통해 정점의 집합을 만들 수 있다. 이를 기반으로 connected component로 만들어보자.



## 그래프 탐색 방법

### 깊이 우선 탐색 (DFS, Depth First Search)

* 그래프를 탐색할 때 쓰는 알고리즘이다.
* 인접한 노드들을 **재귀적으로 방문**하며, 방문한 정점은 다시 방문하지 않는다.
  * 각 **분기마다 가장 멀리 있는 노드까지 탐색**하는 알고리즘이다.
*   수도코드

    ```swift
    DFS(u, adj)
        u.visited = true
        for each v ∈ adj[u] // 인접 리스트를 조회. ∈: 포함
            if v.visited == false // 방문하지 않았다면
                DFS(v, adj) // 재귀함수
    ```
*   DFS 코드

    ```swift
    var graph: [Int: [Int]] = [:]
    var visited = [Bool](repeating: false, count: 10)

    graph[1] = [2, 3]
    graph[2] = [4, 5]
    graph[3] = [1]
    graph[4] = [2]
    graph[5] = [2]
    dfs(u: 1) // 1 2 4 5 3

    func dfs(u: Int) {
        print(u)
        visited[u] = true
        for v in graph[u]! {
            if !visited[v] {
                dfs(u: v)
            }
        }
    }
    ```

```swift
func dfs(u: Int) {
    print(u)
    visited[u] = true
    for v in graph[u]! {
        **if !visited[v] {**
            **dfs(u: v)
        }**
    }
}
```

###

### 너비 우선 탐색 (BFS, Breadth First Search)

* 다음 깊이의 정점으로 이동하기 전, **현재 깊이의 모든 정점을 탐색**하며, **방문한 정점은 다시 방문하지 않는** 알고리즘이다.
  * **같은 가중치**를 가진 그래프에서 **최단 거리 알고리즘**으로 쓰인다.
  * Layer별, **Level 별로 탐색**한다는 의미이다.
* BFS 구현 방법
  *   **자료구조 큐(Queue)**를 사용하면 레벨 별로 탐색이 가능하다.

      ```swift
      // Queue 구현(참고, 구현하지 않아도 된다.)

      struct Queue<T> {
          private var queue: [T] = []
          
          var count: Int {
              queue.count
          }
          
          var isEmpty: Bool {
              queue.isEmpty
          }
          
          var peek: T? {
              queue.first
          }
          
          mutating func enqueue(_ element: T) {
              queue.append(element)
          }
          
          mutating func dequeue() -> T? {
              queue.isEmpty ? nil : queue.removeFirst()
          }
      }
      ```
  *   수도코드 1

      ```swift
      BFS(G, u)
          u.visited = true
          q.push(u);
          while(q.size()) 
              u = q.front() 
              q.pop()
              for each v ∈ G.Adj[u]
                  if v.visited == false
                      v.visited = true
                      q.push(v) 
      ```
  *   수도코드 2 - 최단거리 배열로 쓸 수 있다.

      ```swift
      BFS(G, u)
          u.visited = 1
          q.push(u);
          while(q.size()) 
              u = q.front() 
              q.pop()
              for each v ∈ G.Adj[u]
                  if v.visited == false
                      **v.visited = u.visited + 1**
                      q.push(v) 
      ```
*   Swift 구현

    ```swift
    func bfs(v: Int) {
        var queue: [Int] = [v]
        visited[v] = 1
        
        while !queue.isEmpty {
            let u = queue.removeFirst()
            
            for node in graph[u]! { // 인접리스트니까 리스트가 항상 존재
                if visited[node] > 0 { continue }
                queue.append(node)
                visited[node] = visited[u] + 1 // 가중치가 같을 때, **최단거리 계산**
            }
        }
    }
    ```
* 시작지점이 다수인 경우
  * 큐에 푸시하는 지점도 다수가 되어야한다
  * 해당 지점들의 visited를 모두 1로 만들면서 시작해야한다.
* BFS가 가중치가 같은 그래프 내에서만 최단거리로 쓰이는 이유
  * Level로 최단거리를 측정하기 때문이다.
  * 현재 방법으로는 각 간선마다 다른 가중치를 줄 수 없다.
  * 가중치가 다른 경우의 최단거리를 찾기 위해서는 다익스트라, 벨만포드 등을 써야한다.

### DFS와 BFS 비교

{% hint style="info" %}
문제에서 "퍼져나간다", "탐색한다"가 있는 경우 DFS와 BFS를 우선적으로 떠올려보자.

가중치가 동일한 그래프에서 최단거리를 구할 땐 BFS를 사용하
{% endhint %}

* 시간복잡도 (동일하다)
  * 인접리스트: O(V + E)
  * 인접행렬 : O(V^2)
* 차이점
  * DFS
    * 메모리를 덜 사용한다.
    * 절단점 등을 구할 수 있다. (고급 알고리즘)
    * 코드가 간단하며, 완전탐색의 경우 많이 사용한다.
  * BFS
    * 큐를 구현해야하므로 메모리를 더 쓴다.
    * 가중치가 같은 그래프 내에서 최단거리를 구할 수 있다.

### 트리순회

{% hint style="info" %}
트리 자료구조에서 각 노드를 정확히 한 번만 체계적으로 방문하는 알고리즘이다.

방문 순서에 따라 순회방법이 결정된다.
{% endhint %}

1. 후위순회(postorder traversal)
   *   자식들 노드 방문 후 자신을 방문한다. (왼쪽부터)

       ```swift
       postorder( node )
           if (node.visited == false) 
               postorder( node->left ) 
               postorder( node->right )
               node.visited = true
       ```
2. 전위순회 (preorder traversal)
   * 자신 노드 방문 후 자식 노드를 방문한다.
   *   DFS와 동일하다.

       ```swift
       preorder( node )
           if (node.visited == false)
               node.visited = true
               preorder( node->left )
               preorder( node->right )
       ```
3. 중위순회 (inorder traversal)
   *   왼쪽 자식 노드 → 자신 노드 → 오른쪽 자식 노드

       ```swift
       inorder( node )
           if (node.visited == false) 
               inorder( node->left )
               node.visited = true
               inorder( node->right )
       ```
4.  레벨 순회

    * 같은 레벨을 탐색한다
    * BFS와 동일하다.

    ```swift
    var graph: [Int: [Int]] = [:]

    graph[1] = [2, 3]
    graph[2] = [4, 5]

    print("\\n후위 순회:", terminator: " ")
    postOrder(v: 1)

    print("\\n전위 순회:", terminator: " ")
    preOrder(v: 1)

    print("\\n중위 순회:", terminator: " ")
    inOrder(v: 1)

    func postOrder(v: Int?) { // 후위
        guard let v else { return }
        postOrder(v: graph[v]?[0])
        postOrder(v: graph[v]?[1])
        print(v, terminator: " ")
    }

    func preOrder(v: Int?) { // 전위
        guard let v else { return }
        print(v, terminator: " ")
        preOrder(v: graph[v]?[0])
        preOrder(v: graph[v]?[1])
    }

    func inOrder(v: Int?) { // 중위
        guard let v else { return }
        inOrder(v: graph[v]?[0])
        print(v, terminator: " ")
        inOrder(v: graph[v]?[1])
    }
    ```

## 다익스트라 알고리즘

### 개념

* 여러개의 노드가 있을 때, 특정 노드에서 출발하여 다른 노드로 가는 각각의 최단 경로를 구하는 알고리즘이다.
* 음의 간선이 없을 때 정상적으로 동작한다. (0보다 작은 값을 가질 수 없다)
  * 현실 세계에서는 음의 간선으로 표현되지 않으므로 GPS 기본 알고리즘으로 채택되기도 한다.

### 알고리

1. 출발 노드를 설정한다.
2. 최단 거리 테이블을 초기화한다.
3. 방문하지 않은 노드 중 최단 거리가 가장 짧은 노드를 선택한다. (최소힙 사용)
4. 최단 거리 테이블을 갱신한다.

### 코드

[최소힙 코드](https://sois-organization.gitbook.io/today-i-learned/undefined/heap)

```swift
func dijkstra(_ start: Int) {
    // 최소 힙을 사용한다.
    var queue = Heap<Node>()
    
    // 방문 노드를 설정한다. - 최단 거리가 갱신된 경우 방문 처리한다.
    var visited = [Bool](repeating: false, count: v + 1)
    
    // Start -> start로 가는 경로는 0이다.
    result[start] = 0
    
    queue.push((Node(start, 0)))
    
    // pop은 nil을 리턴할 수 있도록 설계 되었다. 
    while let current = queue.pop() {
        let (node, cost) = (current.node, current.cost)
        guard !visited[node] else { continue }
        visited[node] = true
        
        if let edge = graph[node] {
            for next in edge {
                let (nextNode, nextCost) = (next.node, next.cost)
                
                guard !visited[nextNode] else { continue }
                
                // 기존 비용보다 더 짧은 비용으로 이동가능하다면, 최단 거리 테이블을 갱신한다.
                let newCost = cost + nextCost
                if newCost < result[nextNode] {
                    result[nextNode] = newCost
                    queue.push(Node(nextNode, newCost))
                }
            }
        }
    }
}

```
