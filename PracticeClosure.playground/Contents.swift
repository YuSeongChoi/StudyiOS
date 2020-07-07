import UIKit

var multiplyClousre: (Int, Int) -> Int = {a, b in
    return a * b
}

let result = multiplyClousre(4,2)


func operateTwoNum(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    return result
}

operateTwoNum(a: 4, b: 2, operation: multiplyClousre)

var addClosure: (Int, Int) -> Int = { a, b in
    return a + b
}
operateTwoNum(a: 4, b: 2, operation: addClosure)

operateTwoNum(a: 10, b: 2) {a, b in
    return a / b
}

let voidClousre: () -> Void = {
    print("IOS 개발자 짱, 클로저 사랑해")
}
voidClousre()

// Caputring Values
var count = 0

let incrementer = {
    count += 1
}

incrementer()
incrementer()
count
