var students = Set(1...30)
for _ in 0..<28 {
    students = students.subtracting(Set([Int(readLine()!)!]))
}
students.sorted().forEach { print($0) }
