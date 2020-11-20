//
//  UserInformation.swift
//  SingUp
//
//  Created by Mac on 2020/11/20.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var name: String?
    var age: String?
}
