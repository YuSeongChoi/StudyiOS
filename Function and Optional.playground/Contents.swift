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
