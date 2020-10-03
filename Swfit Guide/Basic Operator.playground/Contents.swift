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
