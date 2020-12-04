//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let softTime: Int = 5
    let mediumTime: Int = 7
    let hardTime: Int = 12

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        if(hardness == "Soft") {
            print(5)
        } else if(hardness == "Medium") {
            print(7)
        } else {
            print(12)
        }
    }
    


}
