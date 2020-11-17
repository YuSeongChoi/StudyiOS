import UIKit

// MARK:- 오류표현
// Error 프로토콜과 (주로) 열거형을 통해서 오류를 표현합니다.

/*
enum 오류종류이름: Error {
 case 종류1
 case 종류2
 case 종류3
 ...
 }
 */

// 자판기 동작 오류의 종류를 표현한 VedingMachineError 열거형
enum VendingMachineError: Error {
    case invalidInput
    case insufficientFunds(moneyNeeded: Int)
    case outOfStock
}

// MARK:- 함수에서 발생한 오류 던지기
// 자판기 동작 도중 발생한 오류 던지기
// 오류 발생의 여지가 있는 메서드는 throws를 사용하여 오류를 내포하는 함수임을 표시합니다.
class VendingMachine {
    let itemPrice: Int = 100
    var itemCount: Int = 5
    var deposited: Int = 0
    
    // 돈 받기 메서드
    func receiveMoney(_ money: Int) throws {
        // 입력한 돈이 0 이하면 오류를 던집니다.
        guard money > 0 else {
            throw VendingMachineError.invalidInput
        }
        // 오류가 없으면 정상 처리를 합니다.
        self.deposited += money
        print("\(money)원 받음.")
    }
    
    // 물건 팔기 메서드
    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
        // 원하는 아이템의 수량이 잘못 입력되었으면 오류를 던집니다.
        guard numberOfItemsToVend > 0 else {
            throw VendingMachineError.invalidInput
        }
        // 구매하려는 수량보다 미리 넣어둔 돈이 적으면 오류를 던집니다.
        guard numberOfItemsToVend * itemPrice <= deposited else {
            let moneyNeeded: Int
            moneyNeeded = numberOfItemsToVend * itemPrice - deposited
            throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
        }
        // 구매하려는 수량보다 요구하는 수량이 많으면 오류를 던집니다.
        guard itemCount >= numberOfItemsToVend else {
            throw VendingMachineError.outOfStock
        }
        // 오류가 없으면 정상처리를 합니다.
        let totalPrice = numberOfItemsToVend * itemPrice
        self.deposited -= totalPrice
        self.itemCount -= numberOfItemsToVend
        return "\(numberOfItemsToVend)개 제공함"
    }
}

// 자판기 인스턴스
let machine: VendingMachine = VendingMachine()
// 판매 결과를 전달받을 변수
var result: String?

// MARK:- 오류 처리
// 오류발생의 여지가 있는 throws 함수(메서드)는 try를 사용하여 호출해야합니다.
// try, try?, try!

// MARK: do-catch
// 오류발생의 여지가 있는 throws 함수(메서드)는 do-catch 구문을 활용하여 오류발생에 대비합니다.

do {
    try machine.receiveMoney(0)
} catch VendingMachineError.invalidInput {
    print("입력이 잘못되었습니다.")
} catch VendingMachineError.insufficientFunds(let moneyNeeded) {
    print("\(moneyNeeded)원이 부족합니다.")
} catch VendingMachineError.outOfStock {
    print("수량이 부족합니다.")
}

// 또는 switch 구문도 사용 가능.
do {
    try machine.receiveMoney(300)
} catch /*(let error)*/ {
    switch error {
    case VendingMachineError.invalidInput:
        print("입력이 잘못되었습니다.")
    case VendingMachineError.insufficientFunds(let moneyNeeded):
        print("\(moneyNeeded)원이 부족합니다.")
    case VendingMachineError.outOfStock:
        print("수량이 부족합니다.")
    default:
        print("알 수 없는 오류 발생.")
    }
}

// 간략화도 가능
do {
    result = try machine.vend(numberOfItems: 4)
} catch {
    print(error)
}

// MARK:- try? 와 try!

/*
 try?
 별도의 오류처리 결과를 통보받지 않고 오류가 발생했으면 결과값을 nil로 돌려받을 수 있습니다.
 정상동작 후에는 옵셔널 타입으로 정상 반환값을 돌려 받습니다.
 */

result = try? machine.vend(numberOfItems: 2)
result

result = try? machine.vend(numberOfItems: 2)
result

/*
 try!
 오류가 발생하지 않을 것이라는 강려한 확신을 가질 때 try!를 사용하면 정상동작 후에 바로 결과값을 돌려받습니다.
 오류가 발생하면 런타임 오류가 발생하여 애플리케이션 동작이 중지됩니다.
 */
result = try! machine.vend(numberOfItems: 1)


/* 고차 함수 */

// 전달인자로 함수를 전달받거나 함수실행의 결과를 함수로 반환하는 함수
// map, filter, reduce

// MARK:- map
// 컨테이너 내부의 기존 데이터를 변형(transform)하여 새로운 컨테이너 생성
let numbers: [Int] = [0, 1, 2, 3, 4]
var doubledNumbers: [Int]
var strings: [String]

// MARK:- for 구문 사용
doubledNumbers = [Int]()
strings = [String]()

for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}
print(doubledNumbers)
print(strings)

// MARK:- map 메서드 사용
// numbers의 각 요소를 2배하여 새로운 배열 반환
doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

strings = numbers.map({ (number: Int) -> String in
    return "\(number)"
})
print(doubledNumbers)
print(strings)

// 매개변수, 반환 타입, 반환 키워드(return) 생략, 후행 클로저
doubledNumbers = numbers.map { $0 * 2}
print(doubledNumbers)

// MARK:- filter
// 컨테이너 내부의 값을 걸러서 새로운 컨테니어로 추출
// MARK: for 구문 사용 (변수 사용에 주의)
var filtered: [Int] = [Int]()

for number in numbers {
    if number % 2 == 0 {
        filtered.append(number)
    }
}
print(filtered)

// MARK: filter 메서드 사용
// numbers의 요소 중 짝수를 걸러내어 새로운 배열로 반환
let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers)

// 매개변수, 반환 타입, 반환 키워드(return) 생략, 후행 클로저
let oddNumbers: [Int] = numbers.filter { return $0 % 2 != 0}
print(oddNumbers)

// MARK:- reduce
// 컨테이너 내부의 콘텐츠를 하나로 통합
let someNumbers: [Int] = [2, 8, 15]

// MARK: for 구문 사용 (변수 사용에 주목)
var res: Int = 0
for number in someNumbers {
    res += number
}
print(res)

// MARK: reduce 메서드 사용
// 초기값이 0이고 someNumber 내부의 모든 값을 더합니다.
let sum: Int = someNumbers.reduce(0) { (first: Int, second: Int) -> Int in
    return first + second
}
print(sum)

let subtract: Int = someNumbers.reduce(0) { (first: Int, second: Int) -> Int in
    return first - second
}
print(subtract)

// 초기값이 3이고 someNumbers 내부의 모든 값을 더합니다.
let sumFromThree = someNumbers.reduce(3) {$0 + $1}
print(sumFromThree)
