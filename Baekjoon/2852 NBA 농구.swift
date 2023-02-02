import Foundation

// 1. n을 입력받는다.
let n = Int(readLine()!)!
var isTeam1Win = 0
var timeTeamA = 0, timeTeamB = 0
var prev = 0

for _ in 0..<n {
    // 2. 정보를 입력받는다.
    let info = readLine()!.split(separator: " ")
    let (team, times) = (info[0], info[1].split(separator: ":").map{ Int($0)! })
    
    // 3. 분 : 초 를 초 단위로 통일시킨다.
    let seconds = times[0].getSeconds() + times[1]
    
    // 4. 시간을 계산한다.
    if isTeam1Win > 0 {
        timeTeamA += seconds - prev
    } else if isTeam1Win < 0 {
        timeTeamB += seconds - prev
    }
    
    isTeam1Win = team == "1" ? isTeam1Win + 1 : isTeam1Win - 1
    prev = seconds
}
if isTeam1Win > 0 {
    timeTeamA += 48.getSeconds() - prev
} else if isTeam1Win < 0 {
    timeTeamB += 48.getSeconds() - prev
}
printFormatting(timeTeamA.getTimes())
printFormatting(timeTeamB.getTimes())

func printFormatting(_ str: [Int]) {
    print(String(format: "%02d:%02d", str[0], str[1]))
}

extension Int {
    func getSeconds() -> Int {
        self * 60
    }
    
    func getTimes() -> [Int] {
        [self / 60, self % 60]
    }
}

