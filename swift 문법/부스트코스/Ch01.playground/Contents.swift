import UIKit

// Swift의 기본 데이터 타입
// Bool, Int, UInt, Float, Double, Character, String

// Bool
var someBool: Bool = true
someBool = false
// Int
var someInt: Int = -100
// UInt
var someUInt: UInt = 100
// Float
var someFloat: Float = 3.14
someFloat = 3
// Double
var someDouble: Double = 3.141592
// Character
var someCharacter: Character = "A"
// String
var someString: String = "SKT T1"
someString += "2021 로스터 확정!?"

// 생각해보기
let integer = 100
let floatingPoint = 12.34
let apple = "A"
type(of: integer)
type(of: floatingPoint)
type(of: apple)

/// Any, AnyObject, nil
/*
 Any - Swift의 모든 타입을 지칭하는 키워드
 AnyObject - 모든 클래스 타입을 지칭하는 프로토콜
 nil - 없음을 의미하는 키워드
 */
// Any
var someAny: Any = 100
someAny = "어떤 타입도 수용 가능"
someAny = 123.12

// AnyObject
class someClass { }
var someAnyObject: AnyObject = someClass()

// Collection Types (Array, Dictionary, Set)
/*
 Array - 순서가 있는 리스트 컬렉션
 Dictionary - 키와 값의 쌍으로 이루어진 컬렉션
 Set - 순서가 없고, 멤버가 유일한 컬렉션
 */

// Array
var integers: Array<Int> = Array<Int>()
integers.append(1)
integers.append(100)

integers.contains(100)
integers.contains(99)

integers.remove(at: 0)
integers.removeLast()
integers.removeAll()

integers.count

// Array<Double>과 [Double]은 동일한 표현
// 빈 Double Array 생성
var doubles: Array<Double> = [Double]()
// 빈 String Array 생성
var strings: [String] = [String]()
// 빈 Character Array 생성
var characters: [Character] = []
// let을 사용하면 불변 Array
let immutableArray = [1, 2, 3, 4]

// Dictionary
var anyDictionary: Dictionary<String, Any> = [String:Any]()
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100
anyDictionary

anyDictionary["someKey"] = "dictionary"
anyDictionary

anyDictionary.removeValue(forKey: "anotherKey")
anyDictionary["someKey"] = nil
anyDictionary

let worlds: [String:String] = ["Team":"DWG", "Leage":"LCK"]
print(worlds)

// Set
var integerSet: Set<Int> = Set<Int>()
// insert: 새로운 멤버 입력 (중복 X)
integerSet.insert(1)
integerSet.insert(1)
integerSet.insert(5)
integerSet.insert(10)
integerSet.insert(10)

print(integerSet)
print(integerSet.contains(1))
print(integerSet.contains(100))
print(integerSet.count)

// Set의 활용
let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]

// 합집합
let union: Set<Int> = setA.union(setB)
print(union)

// 합집합 오름차순 정렬
let sortedUnion: [Int] = union.sorted()
print(sortedUnion)

// 교집합
let intersection: Set<Int> = setA.intersection(setB)
print(intersection)

// 차집합
let subtracting: Set<Int> = setA.subtracting(setB)
print(subtracting)

// 함수 고급
// MARK: - 매개변수 기본값
// 기본값을 주는 매개변수는 매개변수 목록 중에 뒤쪽에 위치하는 것이 좋음.
func greeting(friend: String, me: String = "yuseong") {
    print("Hello \(friend)!, I'm \(me)")
}
greeting(friend: "hana")
greeting(friend: "john", me: "eric")

// MARK: - 전달 인자 레이블
func greeting(to friend: String, from me: String) {
    print("Hello \(friend)!, I'm \(me)")
}
greeting(to: "teddy", from: "faker")

// MARK: - 가변 매개변수
func sayHello(me: String, friends: String...) -> String {
    return "Hello \(friends)!, I am \(me)."
}
print(sayHello(me: "yuseong", friends: "canna","cuzz","faker","teddy","effort"))
print(sayHello(me: "jb", friends: "ys"))

// MARK: - 데이터 타입으로서의 함수
// MARK: 함수의 타입표현 - 변환타입을 생략할 수 없다.

var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction("nuguri","bin")


// MARK: - Optional Unwrapping
// 1. Optional Biding - nil check
// 2. 강제 추출
var optional:Int? = 100
print("This is \(optional!).") // 강제 추출

