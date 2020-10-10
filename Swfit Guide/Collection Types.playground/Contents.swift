import UIKit

var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
// someInts is of type [Int] with 0 items.

someInts.append(3)
someInts[0]

// 기본 값으로 빈 배열 생성
var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles : Double 타입의 [0.0, 0.0, 0.0]

// 다른 배열을 추가한 배열의 생성
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles : [2.5, 2.5, 2.5]

var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles : [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]

// 리터럴을 이용한 배열의 생성
var shoppingList: [String] = ["Eggs", "Milk"]

// 간단한 방법
var shoppingList2 = ["Eggs", "Milk"]

// 배열의 접근 및 변환

// 배열의 원소 갯수 확인
print("The shopping list contains \(shoppingList.count) items.")
// The shopping list contains 2 items.

// 배열이 비어있는지 확인
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}
// The shopping list is not empty.

// 배열에 원소 추가
shoppingList.append("Four")
// shoppingList.count = 3
shoppingList += ["Baking Powder"]
// shoppingList.count = 4
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList.count = 7

// 배열의 특정 위치의 원소 접근
var firstItem = shoppingList[0]
// firstItem : "Eggs"
shoppingList[4...6] = ["Bananas", "Apples"]
// 4, 5, 6번째 인덱스 아이템을 Banana, Apples로 변환
// 즉, 아이템 3개가 2개로 줄었다.

// 특정 위치에 원소 추가/삭제/접근
shoppingList.insert("Maple Syrup", at:0)

let mapleSyrup = shoppingList.remove(at: 0)

firstItem = shoppingList[0]
// firstItem : "Six eggs"

let apples = shoppingList.removeLast()

/// 배열의 순회
// for - loop 활용
for item in shoppingList {
    print(item)
}
// Six eggs
// Milk
// Flour
// Baking Powder
// Bananas

// 배열의 값과 인덱스가 필요할 때 enumerated() 메소드 활용
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}
// Item 1: Six eggs
// Item 2: Milk
// Item 3: Flour
// Item 4: Baking Powder
// Item 5: Bananas



