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
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let diceArray = [ #imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix") ]
        diceImageView1.image = diceArray[Int.random(in: 0...5)]
        diceImageView2.image = diceArray[Int.random(in: 0...5)]
        diceImageView3.image = diceArray[Int.random(in: 0...5)]
        diceImageView4.image = diceArray[Int.random(in: 0...5)]
        diceImageView5.image = diceArray[Int.random(in: 0...5)]
    }
    
}

