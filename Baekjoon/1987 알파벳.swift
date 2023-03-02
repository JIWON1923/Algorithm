let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

let input = readLine()!.split { $0 == " " }.map { Int($0)! }, (r, c) = (input[0], input[1])
var board = [[Int]]()
var result = 0

for _ in 0 ..< r {
    board.append(readLine()!.map { Int($0.asciiValue!) - 65 })
}

dfs(0, 0, 1<<board[0][0], 1)
print(result)

func dfs(_ y: Int, _ x: Int, _ num: Int, _ cnt: Int) {
    result = max(result, cnt)
    for i in 0 ..< 4 {
        let ny = dy[i] + y
        let nx = dx[i] + x
        
        guard ny >= 0 && nx >= 0 && ny < r && nx < c else { continue }
        let next = (1 << board[ny][nx])
        if next & num == 0 {
            dfs(ny, nx, num|next, cnt + 1)
        }
    }
}
