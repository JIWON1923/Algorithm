//
//  main.swift
//  CodingTest
//
//  Created by 이지원 on 2022/04/15.
//

let inputData: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }
var setA = Set<String>()
var setB = Set<String>()
for _ in 0..<inputData[0]{
    setA.insert(readLine()!)
}
for _ in 0..<inputData[1]{
    setB.insert(readLine()!)
}
let result = Array(setA.intersection(setB)).sorted()
print(result.count)
for i in result{
    print(i)
}
