//1. n, c를 입력받는다. (c를 알려주는 이유가 뭐지?)
let input = readLine()!.split(separator: " ").map { Int($0)! }

//2. 수열을 입력받는다.
let numbers = readLine()!.split(separator: " ").map { Int($0)! }

//3. 딕셔너리로 저장한다. [value: [index, count]]
var numberDict: [Int: [Int]] = [:]
var index = 0
for number in numbers {
    if numberDict.keys.contains(number) {
        numberDict[number]![1] += 1
    } else {
        numberDict[number] = [index, 1]
        index += 1
    }
}

//4. 빈도 정렬을 수행한다.
let sortedNumbers = numberDict.sorted { $0.value[0] < $1.value[0] }.sorted { $0.value[1] > $1.value[1] }
var result = ""

for (key, value) in sortedNumbers {
    result += String(repeating: String(key) + " ", count: value[1])
}

print(result)
