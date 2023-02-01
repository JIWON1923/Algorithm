import Foundation

//1. 시간 관련 구조체를 만든다.
struct Clock {
    var hour: Int = 0
    var miniute: Int = 0
}

extension Clock {
    static func -(lhs: Clock, rhs: Clock) -> Clock {
        var miniute = lhs.miniute - rhs.miniute
        var hour = lhs.hour - rhs.hour
        if miniute < 0 {
            miniute += 60
            hour -= 1
        }
        return Clock(hour: hour, miniute: miniute)
    }
    
    static func +(lhs: Clock, rhs: Clock) -> Clock {
        var miniute = lhs.miniute + rhs.miniute
        var hour = lhs.hour + rhs.hour
        if miniute >= 60 {
            miniute -= 60
            hour += 1
        }
        return Clock(hour: hour, miniute: miniute)
    }
    
    static func += (lhs: inout Clock, rhs: Clock) {
        lhs = lhs + rhs
    }
}

enum State {
    case win, draw, lose
}

//2. n을 입력받는다.
let n = Int(readLine()!)!
var prevState = State.draw
//3. 정보를 입력받는다.
var state = State.draw
var winnerTeam = 0 // 0: 무승부, 양수: 1팀 우승, 음수: 2팀 우승
var prevTimeStamp = Clock()
var timeStamp = Clock() {
    didSet {
        let clock = timeStamp - prevTimeStamp
//        prevTimeStamp = clock
        switch state {
        case .draw:
            if prevState == .lose { result[1] += clock }
            else if prevState == .win { result[0] += clock }
        case .win:
            result[0] += clock
        case .lose:
            result[1] += clock
        }
    }
}
var result = [Clock](repeating: Clock(), count: 2)

//4. 팀의 정보가 바뀔 때마다 이기고 있는 시간을 업데이트한다. (동점인 경우를 고려해야함)
for _ in 0..<n {
    defer {
        prevTimeStamp = timeStamp
        timeStamp = Clock(hour: 48)
    }
    
    let input = readLine()!.split(separator: " ")
    let (team, time) = (input[0], input[1].split(separator: ":").map { Int($0)! })
    winnerTeam = team == "1" ? winnerTeam + 1 : winnerTeam - 1
    prevTimeStamp = timeStamp
    timeStamp = Clock(hour: time[0], miniute: time[1])
    
    switch winnerTeam {
    case 0:
        state = .draw
    case 0...:
        state = .win
    case ...0:
        state = .lose
    default:
        continue
    }
}

result.forEach {
    print(String(format: "%02d:%02d", $0.hour, $0.miniute))
}
