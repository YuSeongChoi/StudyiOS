import UIKit

// For-in 문 (For-in Loops)
// for-in 문은 배열, 숫자, 문자열을 순서대로 순회하기 위해 사용된다.
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
// Hello, Anna!
// Hello, Alex!
// Hello, Brian!
// Hello, Jack!

// dictionary 에서도 사용 가능
// 단, 정렬은 되지 않는다.
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
// ants have 6 legs
// spiders have 8 legs
// cats have 4 legs

// 변수자리에 _ 사용 (성능 향상)
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
// Prints "3 to the power of 10 is 59049"

// stride(from:to:by:) 함수와 같이 사용 가능
let minuteInterval = 5
for tickMark in stride(from: 0, to: 15, by: minuteInterval) {
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
    print(tickMark)
}
