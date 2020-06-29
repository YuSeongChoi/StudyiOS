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
