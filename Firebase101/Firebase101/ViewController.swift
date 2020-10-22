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

