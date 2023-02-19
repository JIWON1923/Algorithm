var remains = Set<Int>()
for _ in 0 ..< 10 {
    remains.insert(Int(readLine()!)! % 42 )
}
print(remains.count)
