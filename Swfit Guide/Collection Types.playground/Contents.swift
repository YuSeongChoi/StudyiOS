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


// Set
// Set 형태로 저장하기 위해선 반드시 타입이 HashTable 이어야만 한다.
// Swift에서 String, Int, Double, Bool 같은 기본 타입은 기본적으로 hashable이다. Swift에서 Set 타입은 Set으로 선언한다.

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"] 과 같다.

print("I have \(favoriteGenres.count) favorite music genres.")
// I have 3 favorite music genres.

// 추가
favoriteGenres.insert("Jazz")

// 삭제
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
// Rock? I'm over it.

// 값 확인
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}
// It's too funky in here.

// Set의 순회
for genre in favoriteGenres {
    print("\(genre)")
}
// Classical
// Hip hop
// Jazz

// Set 명령
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]


// Set의 멤버십과 동등 비교
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// 참
farmAnimals.isSuperset(of: houseAnimals)
// 참
farmAnimals.isDisjoint(with: cityAnimals)
// 참


// Dictionary
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

print("The airports dictionary contains \(airports.count) items.")
// The airports dictionary contains 2 items.

// 값 할당
airports["LHR"] = "London"
// the airports dictionary now contains 3 items
