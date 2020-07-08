import UIKit

// 1. 성, 이름을 받아서 full name을 출력하는 함수 만들기
func printFullName(first: String, last: String) {
    print("당신의 이름은 \(first + last) 입니다.")
}

printFullName(first: "Choi", last: "YuSeong")

// 2. 1번에서 만든 함수인데, 파라미터 이름을 제거하고 fullname을 출력하는 함수 만들기
func printFullname2(_ first: String, _ last: String) {
    print("당신의 이름은 \(first + last) 입니다.")
}
printFullname2("최", "유성")


// 3. 성, 이름을 받아서 fullname return 하는 함수 만들기
func printFullName3(first: String, last: String) -> String {
    let fullname = first + last
    return fullname
}
let fullname = printFullName3(first: "유성", last: "최")
print(fullname)

//func functionName(externalName param: ParamType) -> ReturnType {
//    //......
//    return returnValue
//}

// overloading
func printTotalPrice(price: Int, count: Int) {
    print("Total Price : \(price * count)")
}

func printTotalPrice(price: Double, count: Double) {
    print("Total Price: \(price * count)")
}

func printTotalPrice(가격: Double, 개수: Double) {
    print("Total Price: \(가격 * 개수)")
}

// In-out parameter

var value = 3
func incrementAndPrint(_ value: inout Int) {
    value += 1
    print(value)
}

incrementAndPrint(&value)

// ---- Function as a param

func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func subtract(_ a: Int, _ b: Int) -> Int {
    return a - b
}

var function = add
function(4,2)
function = subtract
function(4,2)

func printResult(_ function: (Int, Int) -> Int, _ a:Int, _ b: Int) {
    let result = function(a,b)
    print(result)
}

printResult(add, 10, 5)
printResult(subtract, 10, 5)
