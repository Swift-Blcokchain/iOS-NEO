//
//  NEOWalletsManager.swift
//  iOS-NEO
//
//  Created by afer on 2017/9/10.
//  Copyright © 2017年 afer. All rights reserved.
//

import UIKit
import NeoSwift

public class SaveHelper: NSObject {
//    public var wif: String
//    public var publicKey: Data
//    public var privateKey: Data
//    public var address: String
//    public var hashedSignature: Data
//    publicKeyString
//    privateKeyString
    class func accountToJsonString(account: Account, name: String) -> String {
        let jsonString = "{" +
            "\"name\":\"\(name)\"," +
            "\"wif\":\"\(account.wif)\"," +
            "\"publicKey\":\"\(account.publicKeyString)\"," +
            "\"privateKey\":\"\(account.privateKeyString)\"," +
            "\"address\":\"\(account.address)\"," +
            "\"hashedSignature\":\"\(account.hashedSignatureString)\"" +
                         "}"
        
        print("\(account.publicKey)")
        print("\(String.init(format: "%@", account.publicKey as CVarArg))")
        return jsonString
    }
    
    class func saveAccount(account: Account, name: String) {
        let keychain = Keychain(service: "com.neo.twallets1")
        keychain[account.address + name] = SaveHelper.accountToJsonString(account: account, name: name)
    }
    
    class func getAccounts() -> [SAccount] {
        let keychain = Keychain(service: "com.neo.twallets1")
        let walletsArray = keychain.allItems()
        var sAccountArray = [SAccount]()
        for item in walletsArray {
            let walletString = item["value"] as! String
            let decoder = JSONDecoder()
            guard let sAccount = try? decoder.decode(SAccount.self, from: walletString.data(using: .utf8)!) else {
                    continue
            }
            sAccountArray.append(sAccount)
        }
        print(sAccountArray)
        return sAccountArray
    }
    
    class func removeAccount(account: Account, name: String) {
        let keychain = Keychain(service: "com.neo.twallets1")
        try! keychain.remove(account.address + name)
    }
    
}

class NEOWalletsManager: NSObject {

    class func creatAccountAndSave() {
        let account = Account()
        if account?.publicKey != nil && account?.privateKey != nil {
            NEOAlertView.showWith(title: "温馨提示", message: "创建钱包成功！")
            SaveHelper.saveAccount(account: account!, name: "afer")
        } else {
            NEOAlertView.showWith(title: "温馨提示", message: "创建钱包失败！")
        }
    }
    
    
}
