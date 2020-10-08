import UIKit

// The Swift Language Guide
// 2. 문자열과 문자

for character in "Dog!" {
    print(character)
}

let catCharacters: [Character] = ["C","a","t","!"]
let catString = String(catCharacters)
print(catString)

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
// "unusualMenagerie의 문자는 40개"

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 1)
greeting[index]
// u

// 문자열 개별접근 : indices
for index in greeting.indices {
    print("\(greeting[index]) ", terminator: " , ")
}
// G u t e n  T a g !

// 문자열의 삽입과 삭제
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome : hello!

welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
// welcome : hello there!

welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome : hello there

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
// welcome : hello


// 부분 문자열
let greeting2 = "Hello, World!"
let index2 = greeting2.index(of: ",") ?? greeting.endIndex
let beginning = greeting2[..<index2]
// beginning : Hello

// SubString인 beginning을 String으로 변환
let newString = String(beginning)


// 접두사와 접미사 비교
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

// 접두어 Act 1가 몇개 들어있는지 확인하는 코드
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
// There are 5 scenes in Act 1


// Capulet's mansion 과 Friar Lawrence's cell 갯수 확인
var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// 6 mansion scenes; 2 cell scenes
