let n = Int(readLine()!)!
var skillBoard = [[Int]]()
var sumOfSkills = 0
var result = Int.max

for _ in 0 ..< n {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    sumOfSkills += input.reduce(0, +)
    skillBoard.append(input)
}

getTeams()
print(result)

func getTeams() {
    
    for i in 0 ..< (1 << n)/2 {
        var startTeams = [Int]()
        var linkTeams = [Int]()
        for j in 0 ..< n {
            if i & ( 1 << j ) != 0 {
                startTeams.append(j)
            } else {
                linkTeams.append(j)
            }
        }
        guard startTeams.count == n/2 else { continue }
        
        let startSkill = calculateSkill(teams: startTeams)
        let linkSkill = calculateSkill(teams: linkTeams)
        let gap = calculateSkillGap(startSkill: startSkill, linkSkill: linkSkill)
        result = min(result, gap)
    }
}

func calculateSkill(teams: [Int]) -> Int {
    var teamSkill = 0
    
    for i in 0 ..< teams.count {
        for j in i ..< teams.count {
            let x = teams[i], y = teams[j]
            teamSkill += skillBoard[x][y]
            teamSkill += skillBoard[y][x]
        }
    }
    return teamSkill
}

func calculateSkillGap(startSkill: Int, linkSkill: Int) -> Int {
    return abs(startSkill - linkSkill)
}
