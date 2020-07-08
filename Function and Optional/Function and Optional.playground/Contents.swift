import UIKit

func printName() {
    print("----> My name is YuSeong")
}

printName()

// param 1개
// 숫자를 받아서 10을 곱해서 출력한다.

func printMultipleOfTen(value: Int) {
    print("\(value) * 10 = \(value * 10)")
}

printMultipleOfTen(value: 5)

// param 2개
// 물건값과 개수를 받아서 전체 금액을 출력

func printTotalPrice(price: Int, count: Int) {
    print("Total Price : \(price * count)")
}

printTotalPrice(price: 1500, count: 5)

func printTotalPrice2(_ price: Int, _ count: Int) {
    print("Total Price2 : \(price * count)")
}

printTotalPrice2(1500,5)

func printTotalPrice3(가격 price: Int, 갯수 count: Int) {
    print("Total Price3 : \(price * count)")
}

printTotalPrice3(가격: 2000, 갯수: 5)

func printTotalPriceWithDefaultValue(price: Int = 1500, count: Int) {
    print("Total Price : \(price * count)")
}

printTotalPriceWithDefaultValue(count: 12)
printTotalPriceWithDefaultValue(price: 2500, count: 10)


func totalPrice(price: Int, count: Int) -> Int {
    let totalPrice = price * count
    return totalPrice
}

let calculatedPrice = totalPrice(price: 10000, count: 77)
calculatedPrice

