//
//  ViewController.swift
//  Firebase101
//
//  Created by Mac on 2020/10/22.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    let db = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
        saveBasicTypes()
        saveCustomers()
    }
    
    func updateLabel() {
        db.child("FirstData").observeSingleEvent(of: .value) { snapshot in
            print("--> Here is \(snapshot) ...")
            
            let value = snapshot.value as? String ?? ""
            
            DispatchQueue.main.async {
                self.dataLabel.text = value
            }
        }
    }
}

extension ViewController {
    func saveBasicTypes() {
        // Firebase child("key").setValue(Value)
        // - string, number, dictionary, array
        db.child("int").setValue(3)
        db.child("double").setValue(3.14)
        db.child("str").setValue("setValue == 2020 Worlds Winner is DWG!!")
        db.child("array").setValue(["TES","SU","G2","DWG"])
        db.child("dict").setValue(["TOP":"Nuguri","JUG":"Canyon","MID":"ShowMaker","AD":"Ghost","SUP":"Beryl"])
    }
    
    func saveCustomers() {
        // 책가게
        // 사용자를 저장하겠다.
        // 모델 Customer + Book
        
        let books = [Book(title: "망자는 잠에 들지 않는다.", author: "괴물쥐"), Book(title: "정글은 저튜브", author: "저라뎃")]
        
        let customer1 = Customer(id: "\(Customer.id)", name: "Kane", books: books)
        Customer.id += 1
        let customer2 = Customer(id: "\(Customer.id)", name: "Son", books: books)
        Customer.id += 1
        let customer3 = Customer(id: "\(Customer.id)", name: "Dele", books: books)
        Customer.id += 1
     
        db.child("customers").child(customer1.id).setValue(customer1.toDictionary)
        db.child("customers").child(customer2.id).setValue(customer2.toDictionary)
        db.child("customers").child(customer3.id).setValue(customer3.toDictionary)
    }
}

struct Customer {
    let id: String
    let name: String
    let books: [Book]
    
    var toDictionary: [String:Any] {
        let booksArray = books.map{ $0.toDictionary }
        let dict: [String:Any] = ["id": id, "name": name, "books": booksArray]
        return dict
    }
    
    static var id: Int = 0
}

struct Book {
    let title: String
    let author: String
    
    var toDictionary: [String:Any] {
        let dict: [String:Any] = ["title": title, "author":author]
        return dict
    }
}
