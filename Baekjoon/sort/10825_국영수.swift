struct Score {
    var name: String
    var korean: Int
    var english: Int
    var math: Int
}

let n = Int(readLine()!)!
var students = [Score]()
for _ in 0 ..< n {
    let info = readLine()!.split(separator: " ")
    students.append(Score(name: String(info[0]), korean: Int(info[1])!, english: Int(info[2])!, math: Int(info[3])!))
}

students = students.sorted(){ $0.korean == $1.korean ? ($0.english == $1.english ? ($0.math == $1.math ? $0.name < $1.name: $0.math > $1.math) : $0.english < $1.english) : $0.korean > $1.korean}

for i in students {
    print(i.name)
}
