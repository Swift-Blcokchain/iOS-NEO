//
//  NEOWalletsTableViewController.swift
//  iOS-NEO
//
//  Created by afer on 2017/9/10.
//  Copyright © 2017年 afer. All rights reserved.
//

import UIKit

class NEOWalletsTableViewController: UITableViewController {

    var sAccountArray: [SAccount] = [SAccount]()
    override func viewDidLoad() {
        super.viewDidLoad()
        sAccountArray = SaveHelper.getAccounts()

    }
    @IBAction func createAccountButtonpressed(_ sender: Any) {
        NEOWalletsManager.creatAccountAndSave()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sAccountArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NEOWalletsTableViewCell.self)) as! NEOWalletsTableViewCell
        cell.addressLabel.text = sAccountArray[indexPath.row].address
        cell.nameLabel.text = sAccountArray[indexPath.row].name
        return cell
    }
    
}
