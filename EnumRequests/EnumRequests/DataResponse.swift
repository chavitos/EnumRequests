//
//  DataResponse.swift
//  EnumRequests
//
//  Created by Tiago Chaves on 26/08/20.
//  Copyright © 2020 105 Developers. All rights reserved.
//

import Foundation

struct DataResponse: Codable {
    let data: [User]
    let page: Int
    let limit: Int
    let offset: Int
    let total: Int
}
