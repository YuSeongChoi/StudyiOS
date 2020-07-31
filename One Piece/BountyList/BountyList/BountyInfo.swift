//
//  BountyInfo.swift
//  BountyList
//
//  Created by Mac on 2020/07/31.
//  Copyright © 2020 com.yuseong. All rights reserved.
//

import UIKit

struct BountyInfo {
    let name: String
    let bounty: Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}
