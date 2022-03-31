var info : Array<Int> = [] // 난쟁이 키를 입력받음
var first: Int = 0 // i번째 가짜 난쟁이 정보
var second: Int = 0 // j번째 가짜 난쟁이 정보

// 난쟁이 키 입력받기
for _ in 0...8{
    info.append(Int(readLine()!)!)
}

// 가짜 난쟁이들의 키
let sum: Int = info.reduce(0, +) - 100


for i in 0...7{
    for j in i+1...8{
    
        // 가짜 난쟁이를 발견하면
        if info[i] + info[j] == sum{
        
            // 값을 저장한 후 반복문 탈출
            first = info[i]
            second = info[j]
            break
        }
    }
}

// 가짜 난쟁이를 기존 리스트에서 제거
info.remove(at: info.firstIndex(of: first)!)
info.remove(at: info.firstIndex(of: second)!)

// 오름차순으로 정렬 후 출력
for i in info.sorted(){
    print(i)
}
