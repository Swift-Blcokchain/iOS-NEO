//
//  SAccount.swift
//  iOS-NEO
//
//  Created by afer on 2017/9/11.
//  Copyright © 2017年 afer. All rights reserved.
//

import UIKit

public struct SAccount: Codable {
    var name: String
    var wif: String
    var publicKey: String
    var privateKey: String
    var address: String
    var hashedSignature: String
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case wif = "wif" // need clarification on this value better naming over all would be good
        case publicKey = "publicKey"
        case privateKey = "privateKey"
        case address = "address"
        case hashedSignature = "hashedSignature"
    }
    
    public init(name: String, wif: String, publicKey: String, privateKey: String, address: String, hashedSignature: String) {
        self.name = name
        self.wif = wif
        self.publicKey = publicKey
        self.privateKey = privateKey
        self.address = address
        self.hashedSignature = hashedSignature
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name: String = try container.decode(String.self, forKey: .name)
        let wif: String = try container.decode(String.self, forKey: .wif)
        let publicKey: String = try container.decode(String.self, forKey: .publicKey)
        let privateKey: String = try container.decode(String.self, forKey: .privateKey)
        let address: String = try container.decode(String.self, forKey: .address)
        let hashedSignature: String = try container.decode(String.self, forKey: .hashedSignature)
        self.init(name: name, wif: wif, publicKey: publicKey, privateKey: privateKey, address: address, hashedSignature: hashedSignature)
    }
}
