extension String {
    func getNumber() -> Int {
        switch self {
        case "A"..."C": return 3
        case "D"..."F": return 4
        case "G"..."I": return 5
        case "J"..."L": return 6
        case "M"..."O": return 7
        case "P"..."S": return 8
        case "T"..."V": return 9
        case "W"..."Z": return 10
        default: return 0
        }
    }
}

var result = 0
readLine()!.map { result += String($0).getNumber() }
print(result)
