/*
 
 */

let numString = readLine()!
var result = 0

numString.forEach { char in
    let number = Int(String(char))!

    if number > 1 && result > 1 {
        result *= number
    } else {
        result += number
    }
}

print(result)
