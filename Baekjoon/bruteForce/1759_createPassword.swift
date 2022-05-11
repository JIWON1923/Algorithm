//vowels-> 모음 / consonants-> 자음

import Foundation
let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (l, c) = (input[0], input[1])
var char = readLine()!.split(separator: " ").map{ String($0) }
var visited = [Bool](repeating: false, count: c)
var result = [String](repeating: "", count: l)
var results = ""
char.sort()

recFunc(0, 0, 0, 0)
print(results)

func recFunc(_ k: Int, _ vowels: Int, _ consonants: Int, _ index: Int) {
    if k == l {
        if vowels >= 1, consonants >= 2 {
            results += result.map{ String($0) }.joined(separator: "") + "\n"
        }
        return
    }
    for i in  index ..< c {
        if visited[i] { continue }
        visited[i] = true
        result[k] = char[i]
        if "aeiou".contains( char[i] ) {
            recFunc(k+1, vowels+1, consonants, i)
        } else {
            recFunc(k+1, vowels, consonants+1, i)
        }
        visited[i] = false
    }
}
