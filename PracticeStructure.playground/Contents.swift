import UIKit

// Struct : Call by Value, Class : Call by Reference !!!
// 문제: 가장 가까운 편의점 찾기

// 맨 처음 시작시.... 코드

struct Location {
    let x: Int
    let y: Int
}

struct Store {
    let loc: Location
    let name: String
    let deliveryRange = 2.0
    
    func isDeliverable(userLoc: Location) -> Bool {
        let distanceToStore = distance(current: userLoc, target: loc)
        return distanceToStore < deliveryRange
    }
}

// 현재 스토어 위치들
let store1 = Store(loc: Location(x: 3, y: 5), name:"gs")
let store2 = Store(loc: Location(x: 4, y: 6), name:"seven")
let store3 = Store(loc: Location(x: 1, y: 7), name:"cu")

// 거리 구하는 함수
func distance(current: Location, target: Location) -> Double {
    // 피타고라스
    let distanceX = Double(target.x - current.x)
    let distanceY = Double(target.y - current.y)
    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)
    return distance
}

//가장 가까운 스토어 구해서 프린트하는 함수
func printClosestStore(currentLocaion: Location, stores:[Store]) {
    var closestStoreName = ""
    var closestStoreDistance = Double.infinity
    var isDeliverable = false
    
    for store in stores {
        let distanceToStore = distance(current: currentLocaion, target: store.loc)
        closestStoreDistance = min(distanceToStore, closestStoreDistance)
        if closestStoreDistance == distanceToStore {
            closestStoreName = store.name
            isDeliverable = store.isDeliverable(userLoc: currentLocaion)
        }
    }
    print("Closest store : \(closestStoreName), isDeliverable: \(isDeliverable)")
}

// Stores Array 세팅, 현재 내 위치 세팅
let myLocation = Location(x: 2, y: 5)
let stores = [store1, store2, store3]

// printClosestStore 함수 이용해서 현재 가장 가까운 스토어 출력하기
printClosestStore(currentLocaion: myLocation, stores: stores)


// 도전 과제
// 1. 강의 이름, 강사 이름, 학생수를 가지는 Struct 만들기 (Lecture)
// 2. 강의 어레이와 강사 이름을 받아서, 해당 강사의 강의 이름을 출력하는 함수 만들기
// 3. 강의 3개 만들고 강사이름으로 강의 찾기

struct Lecture {
    var lectureName: String
    var teacherName: String
    var numOfStudents: Int
}

func showLecture(teacher: String, lectures: [Lecture]) {
    for lecture in lectures {
        if(teacher == lecture.teacherName) {
            print("\(teacher) 강사의 강의 이름은. \(lecture.lectureName) 입니다.")
        }
    }
}

let lect1 = Lecture(lectureName: "생활 코딩", teacherName: "egoing", numOfStudents: 10000)
let lect2 = Lecture(lectureName: "iOS 강의", teacherName: "이준원", numOfStudents: 5000)
let lect3 = Lecture(lectureName: "JAVA", teacherName: "egoing", numOfStudents: 3500)

let lectures = [lect1, lect2, lect3]
showLecture(teacher: "egoing", lectures: lectures)


