//let n = Int(readLine()!)!
//var blackArrow = [Int]()
//var whiteArrow = [Int]()
//var result: Int
//var color = 0
//for i in 0 ..< n {
//    let input = readLine()!.split(separator:" ").map{ Int($0)! }
//    if i == 0 { color = input[1] }
//    if input[1] == color { whiteArrow.append(input[0]) }
//    else { blackArrow.append(input[0]) }
//}
//result = sumOfArrows(blackArrow.sorted()) + sumOfArrows(whiteArrow.sorted())
//print(result)
//
//
//func sumOfArrows(_ arrow: [Int]) -> Int {
//    var result = 0
//    let len = arrow.count
//    if len > 1 {
//        for i in 1 ..< len - 1 {
//            result += min((arrow[i] - arrow[i-1]), (arrow[i+1] - arrow[i]))
//        }
//        result += arrow[1] - arrow[0]
//        result += (arrow[len-1] - arrow[len-2])
//    }
//    return result
//}
//

let n = Int(readLine()!)!
var arrows = [Int: [Int]]()
var result = 0
//var arrow = [Int]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let(node, color) = (input[0], input[1])
    if arrows.keys.contains(color) {
        arrows[color]!.append(node)
    } else { arrows[color] = [node] }
}
for arrow in arrows.values {
    result += sumOfArrow(arrow.sorted())
}
print(result)

func sumOfArrow(_ arrow: [Int]) -> Int {
    var result = 0
    let len = arrow.count
    if len > 1 {
        for i in 1 ..< len - 1 {
            result += min( (arrow[i] - arrow[i-1]), (arrow[i+1] - arrow[i]) )
        }
        result += arrow[1] - arrow[0]
        result += arrow[len - 1] - arrow[len - 2]
    }
    return result
}
