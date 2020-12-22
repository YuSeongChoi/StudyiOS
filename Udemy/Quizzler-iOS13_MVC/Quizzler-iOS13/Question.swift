//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Mac on 2020/12/22.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
