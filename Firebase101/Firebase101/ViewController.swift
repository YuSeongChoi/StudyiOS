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
    @IBOutlet weak var numOfCustomers: UILabel!
    @IBOutlet weak var infoBook: UILabel!
    let db = Database.database().reference()
    var customers: [Customer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
        saveBasicTypes()
        saveCustomers()
        fetchCustomers()
        fetchBooks()
        
        // update, delete
//        updateBasicTypes()
//        deleteBasicTypes()
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
    
    @IBAction func createCustomer(_ sender: Any) {
        saveCustomers()
    }
    
    @IBAction func fetchCustomer(_ sender: Any) {
        fetchCustomers()
    }
    
    @IBAction func updateCustomer(_ sender: Any) {
        updateCustomers()
    }
    
    @IBAction func deleteCustomer(_ sender: Any) {
        deleteCustomers()
    }
    
}

extension ViewController {
    func saveBasicTypes() {
        // Firebase child("key").setValue(Value)
        // - string, number, dictionary, array
        db.child("int").setValue(10)
        db.child("double").setValue(10.5)
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
    
    func updateCustomers() {
        guard customers.isEmpty == false else { return }
        customers[0].name = "YuSeong"
        
        let dictionary = customers.map{ $0.toDictionary }
        db.updateChildValues(["customers": dictionary])
    }
    
    func deleteCustomers() {
        db.child("customers").removeValue()
    }
}

// MARK : Read(Fetch) Data
extension ViewController {
    func fetchCustomers() {
        db.child("customers").observeSingleEvent(of: .value) { snapshot in
            print("---> \(snapshot.value)")
            do {
                let data = try JSONSerialization.data(withJSONObject: snapshot.value, options: [])
                let decoder = JSONDecoder()
                let customers: [Customer] = try decoder.decode([Customer].self, from: data)
                self.customers = customers
                DispatchQueue.main.async {
                    self.numOfCustomers.text = "# of Customers : \(customers.count)"
                }
            } catch let error {
                print("---> error : \(error.localizedDescription)")
            }
        }
    }
    
    func fetchBooks() {
        db.child("customers/0/books/0").observeSingleEvent(of: .value) { snapshot in
            print("---> Books \(snapshot.value)")
            do {
                let data = try JSONSerialization.data(withJSONObject: snapshot.value, options: [])
                let decoder = JSONDecoder()
                let books: Dictionary = try decoder.decode(Dictionary<String, String>.self, from: data)
                DispatchQueue.main.async {
                    self.infoBook.text = "Book : \(books.values)"
                }
                
            } catch let error {
                print("---> error : \(error.localizedDescription)")
            }
        }
    }
    
    func updateBasicTypes() {
        db.updateChildValues(["int" : 100])
        db.updateChildValues(["dobule" : 3.141592])
        db.updateChildValues(["str" : "2015, 2016 Worlds Winner is SKT T1"])
    }
    
    func deleteBasicTypes() {
        db.child("int").removeValue()
        db.child("double").removeValue()
        db.child("str").removeValue()
    }
}

struct Customer: Codable {
    let id: String
    var name: String
    let books: [Book]
    
    var toDictionary: [String:Any] {
        let booksArray = books.map{ $0.toDictionary }
        let dict: [String:Any] = ["id": id, "name": name, "books": booksArray]
        return dict
    }
    
    static var id: Int = 0
}

struct Book: Codable {
    let title: String
    let author: String
    
    var toDictionary: [String:Any] {
        let dict: [String:Any] = ["title": title, "author":author]
        return dict
    }
}
