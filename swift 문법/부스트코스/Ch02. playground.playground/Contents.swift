import UIKit

// MARK: 구조체 샘플
// 구조체는 값(value) 타입
struct Sample {
    var mutableProperty: Int = 100 // 가변 프로퍼티
    let immutableProperty: Int = 100 // 불변 프로퍼티
    
    static var typeProperty: Int = 100 // 타입 프로퍼티
    
    // 인스턴스 메서드
    func instanceMethod() {
        print("instance method")
    }
    // 타입 메서드
    static func typeMethod() {
        print("type method")
    }
}

// MARK: 구조체 사용
var mutable: Sample = Sample()
mutable.mutableProperty = 200

Sample.typeProperty = 500
Sample.typeMethod()

// MARK : 클래스 샘플
// 클래스는 참조(reference) 타입, 스위프트는 다중 상속 지원 X
class Student {
    var name: String = "unknow" // 가변 프로퍼티
    var `class`: String = "Swift"
    
    // 타입 메서드
    class func selfIntroduce() {
        print("학생 클래스입니다.")
    }
    // 인스턴스 메서드
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다.")
    }
}
// 타입 메서드 사용
Student.selfIntroduce()

// 인스턴스 생성
var std1: Student = Student()
std1.name = "yuseong"
std1.class = "스위프트"
std1.selfIntroduce()

let std2: Student = Student()
std2.name = "teddy"
std2.selfIntroduce()

// MARK: 열거형 enum
enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach
}
print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")

enum Lol {
    case top
    case jg
    case mid
    case ad
    case spt
}

enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}

print("School.middle.rawValue == \(School.middle.rawValue)")
print("School.university.rawValue == \(School.university.rawValue)")

let apple: Fruit? = Fruit(rawValue: 0)

if let oragne: Fruit = Fruit(rawValue: 5) {
    print("rawValue에 해당하는 케이스는 \(oragne)입니다.")
} else {
    print("rawValue 5에 해당하는 케이스가 없습니다.")
}

/// MARK: 클로저
// 코드의 블럭
// 일급 시민(first-citizen)
// 변수, 상수 등으로 저장, 전달인자로 전달이 가능
// 함수 : 이름이 잇는 클로저

// MARK: - 정의
/*
 { (매개변수 목록) -> 반환타입 in
    실행코드
 }
 */

// 클로저의 사용
var sum: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a + b
}

var sumResult = sum(1,2)
print(sumResult)

// 함수의 전달인자로서의 클로저
let add: (Int, Int) -> Int
add = { (a:Int, b: Int) -> Int in
    return a+b
}

let subtract: (Int, Int) -> Int
subtract = { (a:Int, b:Int) -> Int in
    return a-b
}

let divide: (Int, Int) -> Int
divide = { (a:Int, b: Int) -> Int in
    return a/b
}

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a,b)
}

var calculated: Int
calculated = calculate(a: 50, b: 10, method: add)
print("---> add = \(calculated)")
calculated = calculate(a: 50, b: 10, method: subtract)
print("---> subtract = \(calculated)")
calculated = calculate(a: 50, b: 10, method: divide)
print("---> divide = \(calculated)")
calculated = calculate(a: 50, b: 10, method: { (left: Int, right: Int) -> Int in
    return left * right
})
print("---> multiple = \(calculated)")

/* 클로저 고급 */

/*
 후행 클로저
 반환타입 생략
 단축 인자이름
 암시적 반환 표현
*/

var result: Int
// MARK: - 후행 클로저
// 클로저가 함수의 마지막 전달인자라면 마지막 매개변수 이름을 생략한 후 함수 소괄호 외부에 클로저를 구현할 수 있습니다.
result = calculate(a: 10, b: 10) { (left: Int, right: Int) -> Int in
    return left + right
}

// MARK: 반환타입 생략
result = calculate(a: 10, b: 10, method: { (left: Int, right: Int) in
    return left + right
})
result = calculate(a: 10, b: 10) {(left:Int, right:Int) in
    return left + right
}

// 단축 인자이름, 암시적 반환 표현
result = calculate(a: 10, b: 20) {$0 + $1}

/// MARK: -  프로퍼티
/*
 저장 프로퍼티(stored property)
 연산 프로퍼티(computed property)
 인스턴스 프로퍼티(instance property)
 타입 프로퍼티(type property)
 */

// 프로퍼티는 구조체, 클래스, 열거형 내부에 구현할 수 있다.
// 다만 열거형 내부에는 연산 프로퍼티만 구현할 수 있다.
// 연산 프로퍼티는 var로만 선언할 수 있다.

struct Money {
    //프로퍼티 감시자 사용
    var currenctRate: Double = 1000 {
        willSet(newRate) {
            print("환율이 \(currenctRate)에서 \(newRate)으로 변경될 예정입니다.")
        }
        didSet(oldRate) {
            print("환율이 \(oldRate)에서 \(currenctRate)으로 변경되었습니다.")
        }
    }
    //프로퍼티 감시자 사용
    var dollar: Double = 0 {
        willSet {
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다.")
        }
        didSet {
            print("\(oldValue)달러에서 \(dollar)달러로 변경되었습니다.")
        }
    }
    //연산 프로퍼티
    var won: Double {
        get {
            return dollar * currenctRate
        }
        set {
            dollar = newValue / currenctRate
        }
        // 프로퍼티 감시자와 연산 프로퍼티 기능은 동시에 사용할 수 없다!!
    }
}

var moneyInMyPocket = Money()
moneyInMyPocket.won = 11000
print("---> 내 주머니에는 \(moneyInMyPocket.won)이 있고 이걸 환전하면 \(moneyInMyPocket.dollar)야!")

// MARK: - 프로퍼티 감시자
// 프로퍼티 감시자를 사용하면 값이 변경될 때 원하는 동작을 수행할 수 있다.
moneyInMyPocket.currenctRate = 1100
moneyInMyPocket.dollar = 20
print("---> 바뀐 내 돈은 얼마야?? \(moneyInMyPocket.won)")


/// MARK:- 인스턴스 생성/ 소멸 (init / deinit)
//  스위프트의 모든 인스턴스는 초기화와 동시에 모든 프로퍼티에 유효한 값이 할당되어 있어야 한다.
class PersonB {
    var name: String
    var age: Int
    var nickName: String
    
    // 이니셜라이저
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}
let hana: PersonB = PersonB(name: "hana", age: 20, nickName: "하나마나")

// 프로퍼티의 초기값이 꼭 필요 없을 때
class PersonC {
    var name: String
    var age: Int
    var nickName: String?
    
    convenience init(name: String, age: Int, nickName: String) {
        self.init(name: name, age: age)
        self.nickName = nickName
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let jenny: PersonC = PersonC(name: "jenny", age: 18)
let mike: PersonC = PersonC(name: "mike", age: 15, nickName: "마이크앤다이크")

// 실패 가능한 이니셜라이저
class PersonD {
    var name: String
    var age: Int
    var nickName: String?
    
    init?(name: String, age: Int) {
        if(0...120).contains(age) == false {
            return nil
        }
        if(name.count == 0) {
            return nil
        }
        self.name = name
        self.age = age
    }
}

// MARK:- 옵셔널 체이닝과 nil 병합
class Person {
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomeNumber: String
    var `guard` : Person?
    var owner: Person?
    
    init(dong: String, ho: String) {
        buildingNumber = dong
        roomeNumber = ho
    }
}

let yuseong: Person? = Person(name: "yuseong")
let apart: Apartment? = Apartment(dong: "2", ho: "401")
let yasuo: Person? = Person(name: "yasuo")

// 옵셔널 체이닝이 실행 후 결과값이 nil일 수 있으므로 결과 타입도 옵셔널이다.
func guardJobWithOptionalChaining(owner: Person?) {
    if let guardJob = owner?.home?.guard?.job {
        print("우리집 경비원의 직업은 \(guardJob)입니다.")
    } else {
        print("우리집 경비원은 직업이 없어요.")
    }
}

guardJobWithOptionalChaining(owner: yuseong)

// nil 병합 연산자
let guardJob = yuseong?.home?.guard?.job ?? "2코어 야스오 1대5 펜타킬 가능"
print(guardJob)
