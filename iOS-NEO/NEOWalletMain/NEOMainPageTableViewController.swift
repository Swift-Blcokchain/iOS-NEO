//
//  NEOMainPageTableViewController.swift
//  iOS-NEO
//
//  Created by afer on 2017/9/10.
//  Copyright © 2017年 afer. All rights reserved.
//

import UIKit
import NeoSwift

class NEOMainPageTableViewController: UITableViewController {

    var sAccount: SAccount?
    var account: Account?
    
    @IBOutlet weak var neoLabel: UILabel!
    @IBOutlet weak var gasLabel: UILabel!
    
    class func vc() -> NEOMainPageTableViewController? {
        let sd = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainvc = sd.instantiateViewController(withIdentifier: String(describing: NEOMainPageTableViewController.self))
        return mainvc as? NEOMainPageTableViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.initAccount()
        self.getAssets()
       
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            break
        case 1:
            break
        case 2: // Transaction
            break
        case 3: // Receive
            let receivevc = NEOReceiveViewController.vc()
            self.navigationController?.pushViewController(receivevc!, animated: true)
            break
        case 4: // Contacts
            break
        case 5: // backups
            break
        case 6: // create account
//            self.createAccount()
            break
        case 7:
            break
        case 8: // change wallet
            self.navigationController?.popViewController(animated: true)
            break
        default:
            break
        }
    }
   
}
extension NEOMainPageTableViewController {

    func initAccount() {
        account = Account(wif: (sAccount?.wif)!)
    }
    
    func getAssets() {
        account?.getBalance(completion: { (assets, error) in
            if error == nil {
                self.loadAssets(assets: assets)
            } else {
                NEOAlertView.showWith(title: "温馨提示！", message: "钱包金额获取失败！")
                self.navigationController?.popViewController(animated: true)
            }
        })
    }
    
    func loadAssets(assets: Assets?) {
        if let nowassets = assets {
            DispatchQueue.main.async {
                self.neoLabel.text = "\(nowassets.neo.balance)"
                self.gasLabel.text = "\(nowassets.gas.balance)"
            }
            
        }
    }
}
