//1. 알파벳을 키로 둔 딕셔너리를 선언한다. (value는 0)
var dict = ["a" : 0, "b": 0, "c" : 0, "d" : 0,  "e" : 0,  "f" : 0,  "g" : 0,  "h" : 0,  "i" : 0,
            "j" : 0,  "k" : 0,  "l" : 0,  "m" : 0, "n" : 0,  "o" : 0,  "p" : 0,  "q" : 0,  "r" : 0,
            "s" : 0,  "t" : 0,  "u" : 0,  "v" : 0,  "w" : 0,  "x" : 0,  "y" : 0,  "z" : 0]

//2. 문자열을 입력받는다.
let string = readLine()!

//3. 문자열을 순회하며 value를 +1한다.
for char in string {
    dict[String(char)]! += 1
}

//4. 결과를 출력한다.
var result = ""
for (_, value) in dict.sorted(by: { $0.key < $1.key }) {
    print(value, terminator: " ")
}
