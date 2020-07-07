import UIKit

var scoreDic: [String: Int] = ["Jason":88, "Jay":95,"Jake":98]
//var scoreDic2: Dictionary<String, Int> = ["Jason":88, "Jay":95,"Jake":98]

if let score = scoreDic["Jason"] {
    score
} else {
    //... Nil
}
scoreDic["Jay"]

scoreDic.isEmpty
scoreDic.count


//기존 사용자 업데이트
scoreDic["Jason"] = 99
scoreDic

// 사용자 추가
scoreDic["Jack"] = 100
scoreDic

// 사용자 제거
scoreDic["Jack"] = nil
scoreDic

// For Loop
for (name, score) in scoreDic {
    print("\(name), \(score)")
}

for key in scoreDic.keys {
    print(key)
}

// 1. 이름, 직업, 도시 딕셔너리
// 2. 도시를 부산으로 업데이트
// 3. 딕셔너리를 받아서 이름과 도시 프린트하는 함수 만들기

//var ID: [String: String] = ["YuSeong":"Incheon"]
//ID["YuSeong"] = "Busan"
//ID

var myDic: [String: String] = ["name":"Yuseong","job":"Student","city":"Incheon"]
myDic["city"] = "Busan"
myDic

func printNameAndCity(dic: [String: String]) {
    if let name = dic["name"], let city = dic["city"] {
        print(name, city)
    } else {
        print("---> Canno Find")
    }
}

printNameAndCity(dic: myDic)
