import UIKit

var carName: String?
carName = nil
carName = "Maserati"

// 아주 간단한 과제
// 1. 최애 영화 배우의 이름을 담는 변수 작성 (타입 String?)
// 2. let num = Int("10") -> 타입?
var favoriteMovieStar: String? = nil
let num = Int("10")

// Int의 소괄호 안이 변환이 될 수도 있고 안될 수도 있기 때문에 Int?형으로 캐스팅된 것.

// 고급 기능 4가지
// 1. Forced unwrapping -> 강제로 박스를 까보기
// 2. Optional biding (if let) -> 부드럽게 박스를 까보자 1
// 3. Optional biding (guard) -> 부드럽게 박스를 까보자 2
// 4. Nil coalescing -> 박스를 까봤더니, 값이 없으면 디폴트 값을 줘보자.

// 1. Forced unwrapping
print(carName!)


// 2. Optional biding (if let)
if let unwrappedCarName = carName {
    print(unwrappedCarName)
} else {
    print("Car Name is none")
}

func printParsedInt(from: String) {
    if let parsedInt = Int(from) {
        print(parsedInt)
    } else {
        print("Int로 컨버팅 안된다.")
    }
}

printParsedInt(from: "Hello")

// 3. Optional biding (guard)
func printParsedInt2(from: String) {
    guard let parsedInt = Int(from) else{
        print("Int로 컨버팅이 안된다. 2 ")
        return
    }
    print(parsedInt)
}

printParsedInt2(from: carName!)

// 4. Nil coalescing
carName = nil
let myCarName: String = carName ?? "모델 5"


// --- 도전 과제
// 1. 최애 음식 이름을 담는 변수를 작성 (String?)
// 2. 옵셔널 바인딩을 이용해서 값을 확인
// 3. 닉네임을 받아서 출력하는 함수 만들기, 입력 파라미터는 String?

let favoriteFood:String? = "곱창"

if let foodName = favoriteFood {
    print(foodName)
} else {
    print("좋아하는 음식 없음")
}


func printNickName(name: String?) {
    guard let nickName = name else {
        print("Please make you nickname")
        return
    }
    print(nickName)
}

printNickName(name: nil)
