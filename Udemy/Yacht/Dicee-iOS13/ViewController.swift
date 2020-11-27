//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var diceImageView3: UIImageView!
    @IBOutlet weak var diceImageView4: UIImageView!
    @IBOutlet weak var diceImageView5: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diceImageView2.image = #imageLiteral(resourceName: "DiceTwo")
        diceImageView3.image = #imageLiteral(resourceName: "DiceThree")
        diceImageView4.image = #imageLiteral(resourceName: "DiceFour")
        diceImageView5.image = #imageLiteral(resourceName: "DiceFive")
    }


}

