//
//  HistoryViewController.swift
//  MyNetflix
//
//  Created by Mac on 2020/11/11.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import UIKit
import Firebase

class HistoryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let db = Database.database().reference().child("searchHistory")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        db.observeSingleEvent(of: .value) { (snapshot) in
            print("---> snapshot : \(snapshot.value)")
        }
    }
}
class HistoryCell: UITableViewCell {
    @IBOutlet weak var searchTerm: UILabel!
        
}
