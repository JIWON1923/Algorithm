/*
 문제) p.201
    오늘 동빈이는 여행 가신 부모님을 대신해서 떡집 일을 하기로 했다. 오늘은 떡볶이 떡을 만드는 날이다. 동빈이네 떡볶이 떡은 재밌게도 떡볶이 떡의 길이가 일정하지 않다. 대신에 한 봉지 않에 들어가는 떢의 총 길이는 절단기로 잘러서 맞춰준다. 절단기에 높이를 지정하면 줄지어진 떠을 한 번에 절단한다. 높이가 H보다 긴 떡은 H위의 부분이 잘릴 것이고, 낮은 떡은 잘리지 않는다. 예를 들어 19, 14, 10, 17cm인 떡이 나란히 있고, 절단기 높이를 15cm로 지정하면 자른 뒤 떡의 높이는 15, 14, 10, 15 cm가 될 것이다. 잘린 떡의 길인느 차례대로 4, 0, 0, 2cm이다. 손님은 6cm만큼의 길이를 가져간다. 손님이 왔을 때 요청한 길이가 총 M일 때 적어도 M만큼의 떡을 얻기 위해 절단기네 설정할 수 있는 높이의 최댓값을 구하는 프로그램을 작성하시오
 
    4 6
    19 15 10 17
 
    15
 */

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (input[0], input[1])
let riceCakes = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
var (start, end) = (0, riceCakes[riceCakes.count - 1])
var result = 0
while start <= end {
    let mid = (start + end) / 2
    var total = 0
    riceCakes.forEach { riceCake in
        total += riceCake > mid ? riceCake - mid : 0
    }
    if total >= m {
        result = mid
        start = mid + 1
    } else {
        end = mid - 1
    }
}
print(result)
