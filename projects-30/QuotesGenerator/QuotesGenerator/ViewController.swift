//
//  ViewController.swift
//  QuotesGenerator
//
//  Created by Mac on 2021/09/10.
//

import UIKit

/*
 Content Hugging Priorty
 Content Compression Resistance Priorty
 */

class ViewController: UIViewController {
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    let quotes = [
        Quote(contents: "부진은 있어도 몰락은 없다.", name: "kkoma 김정균"),
        Quote(contents: "똑바로 ! 짝! 뛰라고! 짝! 이 아이야! 짝!", name: "DS Khan"),
        Quote(contents: "가지가지 나뭇가지", name: "T1 Faker"),
        Quote(contents: "나라는 괴물..... 이게... 나야....", name: "쓰레기 클템"),
        Quote(contents: "슉.. 슈슉... 슉.. 슈슈슉..슉..슈슈슈슉..슉..슈슉..", name: "돌하르방")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapQouteGeneratorButton(_ sender: Any) {
        let random = Int(arc4random_uniform(5)) // 0~4 사이의 상수들
        let quote = quotes[random]
        
        quoteLabel.text = quote.contents
        nameLabel.text = quote.name
    }
    
}

