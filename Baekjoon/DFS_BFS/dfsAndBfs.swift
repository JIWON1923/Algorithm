var info: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!} // n, m, v 입력받기
var visited_dfs = [Bool](repeating: false, count: info[0]+1) // 방문여부 저장
var visited_bfs = visited_dfs // 방문여부 저장(하단에 설명 써 놓을게요)
var graph = [[Int]](repeating: [], count: info[0]+1) // 그래프 초기화

//그래프 입력받기
for _ in 1...info[1]{
    let node:[Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    // 간선은 양방향이므로, 다음과 같이 저장해야합니다.
    graph[node[0]].append(node[1])
    graph[node[1]].append(node[0])
}

func dfs(v: Int){
    visited_dfs[v] = true
    print(v, terminator: " ") // 개행문자 대신 " "로 출력한다.
    
    // 방문할 수 있는 정점이 여러 개인 경우에는 정점 번호가 작은 것을 먼저 방문
    // (문제조건) -> sorted로 작은 것 먼저 탐색
    for i in graph[v].sorted(){
        if !visited_dfs[i]{
            dfs(v:i)
        }
    }
}

func bfs(v: Int){
    visited_bfs[v] = true
    var queue:[Int] = [v]
    while queue.count != 0{
        let v = queue.removeFirst()
        print(v, terminator: " ")
        
        // 방문할 수 있는 정점이 여러 개인 경우에는 정점 번호가 작은 것을 먼저 방문
        // (문제조건) -> sorted로 작은 것 먼저 탐색
        for i in graph[v].sorted(){
            if !visited_bfs[i]{
                queue.append(i)
                visited_bfs[i] = true
            }
        }
    }
}

// 시작노드를 삽입하여 탐색 시작
dfs(v:info[2])
print() // dfs 결과와 bfs 결과를 개행문자로 분리한다. (없으면 한줄에 다 출력돼요)
bfs(v:info[2])
