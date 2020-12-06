//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    let eggTimes : [String:Int] = ["Soft":5, "Medium":420, "Hard":720]
    var secondsRemaing = 60
    var timer = Timer()

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        secondsRemaing = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsRemaing > 0 {
            print("\(secondsRemaing) seconds.")
            secondsRemaing -= 1
        } else {
            timer.invalidate()
            titleLabel.text = "완료!!"
        }
    }
    


}
