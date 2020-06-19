//
//  ViewController.swift
//  MyAlbum
//
//  Created by Mac on 2020/06/19.
//  Copyright © 2020 com.yuseong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Hello", message: "My First App!", preferredStyle:.alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func challenge(_ sender: Any) {
        let alert = UIAlertController(title: "SoongSil Univ.", message: "Software 20150285", preferredStyle:.alert)
        let action = UIAlertAction(title: "BYE", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

    }
}

