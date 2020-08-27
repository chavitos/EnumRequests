//
//  User.swift
//  EnumRequests
//
//  Created by Tiago Chaves on 22/08/20.
//  Copyright © 2020 105 Developers. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: String
    let title: String
    let firstName: String
    let lastName: String
    
    var greeting: String {
        return "Hello \(title) \(firstName) \(lastName)!"
    }
}
