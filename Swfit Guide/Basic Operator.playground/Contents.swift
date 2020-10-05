import UIKit

// 할당 연산자
let b = 10
var a = 5
a = b // a 값은 10

let (x,y) = (1, 2) // x 값은 1, y 값은 2

// 사칙 연산자
1 + 2
5 - 3
2 * 3
10 / 3

"2020 LoL Winner is " + "DAMWON Gaming"
9 % 4
-9 % 4

let three = 3
let minusThree = -three
let plusThree = -minusThree

var c = 1
c += 100

// 비교 연산자
let name = "world"
if name == "world" {
    print("Login Access")
} else {
    print("Sorry \(name), Do not access")
}

// 삼항 연산자
let weight = 10
let isPerson = true
let myWeight = weight + (isPerson ? 60 : 0)

// nil 병합 연산자
// a??b 형태의 연산자
// 옵셔널 a를 벗겨서(unwraps) 만약 a가 nil인 경우 b를 반환

let defaultColor = "red"
var userDefineColor: String?

var colorName = userDefineColor ?? defaultColor
userDefineColor = "green"
colorName = userDefineColor ?? defaultColor

// 범위 연산자

// 1. 닫힌 범위 연산자
for index in 1...5 {
    print("\(index) times 5 is \(5 * index)")
}
print("")
// 2. 반 닫힌 범위 연산자
let names = ["Nuguri", "Canyon","Showmaker","Ghost","Beryl"]
let count = names.count
for i in 0..<count {
    print("Damwon Gaming Member \(i+1) is \(names[i])")
}
print("")
// 3. 단방향 범위
// [a..] , [..a]의 형태로 범위의 시작 혹은 끝만 지정해 사용하는 범위 연산자
// 지정한 시작 값 혹은 끝 값도 범위에 포함
for name in names[2...] {
    print(name)
}
print("")
for name in names[...2] {
    print(name)
}
// [..<2] 도 사용 가능 , 이 때는 범위에 포함되지 않는다.


