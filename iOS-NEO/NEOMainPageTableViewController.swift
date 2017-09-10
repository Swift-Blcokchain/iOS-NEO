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

    override func viewDidLoad() {
        super.viewDidLoad()
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
            break
        default:
            break
        }
    }

   
}
