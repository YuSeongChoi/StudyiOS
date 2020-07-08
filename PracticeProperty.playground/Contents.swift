import UIKit

// Stored Property = 데이터 저장
struct Person {
    var firstName: String {
        willSet {
            print("willSet: \(firstName) --> \(newValue)")
        }
        didSet {
            print("didSet: \(oldValue) --> \(firstName)")
        }
    }
    var lastName: String
    
    // 느리게 실행
    lazy var isPopular: Bool = {
        if fullName == "Jay Park" {
            return true
        }else {
            return false
        }
    }()
    
    // Computed Property = 데이터 가공
    var fullName: String {
        get {
         return "\(firstName) \(lastName)"
        }
        
        set {
            // newValue "Jay Park"
            if let firstName = newValue.components(separatedBy: " ").first {
                self.firstName = firstName
            }
            
            if let lastName = newValue.components(separatedBy: " ").last {
                self.lastName = lastName
            }
        }
    }
    
    static let isAlien: Bool = false
}

var person = Person(firstName: "Jason", lastName: "Lee")

person.firstName
person.lastName

person.firstName = "Jim"
person.lastName = "Kim"

person.firstName
person.lastName
person.fullName = "Jay Park"
person.fullName

Person.isAlien
// static은 인스턴스에 상관없이 생성된 프로퍼티이다. (static)

person.isPopular
