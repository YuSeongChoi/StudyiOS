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
    @IBOutlet weak var timeProgressBar: UIProgressView!
    let eggTimes : [String:Int] = ["Soft":5, "Medium":420, "Hard":720]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            let percentageProgress = secondsPassed / totalTime
            timeProgressBar.progress = Float(percentageProgress)
            secondsPassed += 1
        } else {
            timer.invalidate()
            titleLabel.text = "완료!!"
        }
    }
    


}
