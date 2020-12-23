//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    var num: Int = 0
    
    let stories = [
        Story(title: "You see a fork in the road", choice1: "Take a left", choice2: "Take a right"),
        Story(title: "You see a tiger", choice1: "Shout for help", choice2: "play dead"),
        Story(title: "You find a treasure chest", choice1: "Open it", choice2: "Check for traps")
    ]
    
    let story0 = "길에 갈림길이 보입니다."
    let choice1 = "왼쪽으로 갑니다."
    let choice2 = "오른쪽으로 갑니다."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        let choice = String(sender.titleLabel?.text! ?? "nil")
        if(choice == stories[num].choice1) {
            num += 1
        } else {
            num += 2
        }
        
        checkStory()
        updateUI()
    }
    
    func updateUI() {
        storyLabel.text = stories[num].title
        choice1Button.setTitle(stories[num].choice1, for: .normal)
        choice2Button.setTitle(stories[num].choice2, for: .normal)
    }
    
    func checkStory() {
        if(num+1 > stories.count) {
            num = 0
        }
    }
    
}

