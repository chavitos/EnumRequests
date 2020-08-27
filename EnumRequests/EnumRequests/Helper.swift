//
//  Helper.swift
//  EnumRequests
//
//  Created by Tiago Chaves on 22/08/20.
//  Copyright © 2020 105 Developers. All rights reserved.
//

import Foundation

extension Encodable {
    func encode(with encoder: JSONEncoder = JSONEncoder()) throws -> Data {
        return try encoder.encode(self)
    }
}

extension Decodable {
    static func decode(with decoder: JSONDecoder = JSONDecoder(), from data: Data) throws -> Self {
        return try decoder.decode(Self.self, from: data)
    }
}
