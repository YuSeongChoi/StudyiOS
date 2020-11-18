//
//  SecondViewController.swift
//  SingUp
//
//  Created by Mac on 2020/11/18.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func popToPrev(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
