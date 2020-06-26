import UIKit
import Foundation


// --- while

print("--- while")
var i = 10
while i < 10 {
    print(i)
    
    if (i==5) {
        print("탈출합니다.")
        break
    }
    i += 1
}

print("--- Repeat")
i = 10
repeat{
    print(i)
    i += 1
} while i < 10 // JAVA do ~ while

// --- For loop

let closedRange = 0...10
let halfClosedRange = 0..<10

var sum = 0
for i in halfClosedRange {
    print("---> \(i)")
    sum += i
}

print("---> total sum : \(sum)")

var sinValue: CGFloat = 0
for i in closedRange {
    sinValue = sin(CGFloat.pi/4 * CGFloat(i))
}

let name = "YuSeong"
for _ in closedRange {
    print("---> name: \(name)")
}
// i를 사용하지 않을 경우는 _를 사용한다.

for i in closedRange {
    if i % 2 == 0{
        print("---> 짝수 : \(i)")
    }
}

for i in closedRange where i % 2 == 0 {
    print("---> 개선된 코드의 짝수 : \(i)")
}

for i in closedRange {
    if i == 3 {
        print("3은 건너뜁니다.")
        continue
    }
    print("---> \(i)")
}
//
//for i in halfClosedRange {
//    for j in halfClosedRange {
//        print("구구단 -> \(i) * \(j) = \(i*j)")
//    }
//}

// ---- Switch
let num = 10

switch num {
case 0...10:
    print("---> 0~10 입니다.")
default:
    print("---> 나머지 입니다.")
}

let pet = "bird"

switch pet {
case "dog", "cat", "bird":
    print("---> 애완동물입니다.")
default:
    print("---> 잘 모르겠습니다.")
}

let num2 = 10
switch num2 {
case _ where num2 % 2 == 0:
    print("---> 짝수")
default:
    print("---> 홀수")
}

let coordinate = (x: 2, y: 10)

switch coordinate {
case (0,0):
    print("---> 원점 입니다.")
case (let x, 0):
    print("---> x축 입니다. x:\(x)")
case (0, let y):
    print("---> y축 입니다. y:\(y)")
case (let x, let y):
    print("좌표 어딘가... x:\(x),\(y)")
    
}
