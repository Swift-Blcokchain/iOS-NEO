//
//  NEOWalletsTableViewController.swift
//  iOS-NEO
//
//  Created by afer on 2017/9/10.
//  Copyright © 2017年 afer. All rights reserved.
//

import UIKit

//[iOS_NEO.SAccount(name: "afer", wif: "KxuCmcw8zAAbT9JsgFaqsXr38NbNNGpmC6eqHJ4LY2wSsZUUdada", publicKey: "33 bytes", privateKey: "32 bytes", address: "AckvyKJHhCC9BMRiohevzi8aBV9JVqx4vz", hashedSignature: "20 bytes"), iOS_NEO.SAccount(name: "afer", wif: "L3pXKSwkFnzqDZVaMN4gKJH5XdpbUWEGR1sy9GL2MgQVMN4jGx8Y", publicKey: "33 bytes", privateKey: "32 bytes", address: "AUHCQAujvqo7H9LuQSwoHD1AbXvaKYerNn", hashedSignature: "20 bytes"), iOS_NEO.SAccount(name: "afer", wif: "L2VuyDUopoPMSepSUsg1QF4sNQPV3uqj6NgUT1Fpa4dZtURM958U", publicKey: "037af440504c202500a88015f11524c3d7b64a32c1bdaad12c61fcfb4f2d48abc4", privateKey: "9d85c3fa8de453e976abd9ecc6ec8c7dc84b8dac8e0720a4941d468a9f38a50b", address: "AdZrFT6YCRHdAJQSogzovemPY8VpieojYH", hashedSignature: "ef0c9bf6c342010c0e35c9424cfcbe2dfa77c2d0"), iOS_NEO.SAccount(name: "afer", wif: "Kxrzp4xZTuGsfvqMYjCofieBnY8bayPNhZ3MKZv4BdHPN99CEN57", publicKey: "035d964db75c8d063f8a37bab1228f093248e549fdf50fb9e6d76328c66aa9d6d5", privateKey: "3104e26b7355cd6b9f1b26c9da069a863a75f60133960736fd38ac044f437296", address: "AJ4LJF3EbnRKsVr42YJKaKaTsUjRQt8XkN", hashedSignature: "190d2765c7d960f8862bed437a53d7e32489166f"), iOS_NEO.SAccount(name: "afer", wif: "KwS8S1APauDAEqyXvDnG1GfRxwV3dVxuN6HVgvYyLoYSfMUVnwiK", publicKey: "032c724d2ddcc6d22bee3433d0a172dc32fb40f2edd32c730b861dafbf6f2a9e97", privateKey: "066368e13a3ce28c97eddbff58f2e36a4ba91d67c9375518b044a3cf2b0ed9c2", address: "ATZc4PNWc754wF3o5y7ZKJytrBrvqJnyfT", hashedSignature: "814f816b5b9d1d7f4b083b5c0a74392e0c425d01"), iOS_NEO.SAccount(name: "afer", wif: "Ky7Rda7LMzLurM1T3KnSvWverbyDAdzvLiuUACbDbA4DQCQTXgpU", publicKey: "03bfdd5a96942a731564b6e1c8e2929f94176658398a6390d8e926a9c5717b0669", privateKey: "3870fc00b8598a7076b9a63bb6d7f93137902f093104fcd6a137290838130846", address: "ATig1wFz3R36x4M3DgexfzvxLF2dVXSTwb", hashedSignature: "83068d8f4e22d2112e83b71f8a2e9c2345c8d745"), iOS_NEO.SAccount(name: "afer", wif: "KzJPNUQQTCBnx1oKBtTZKF2h5K1S9zVdgmEEJPcy7xPeSgQ3obpQ", publicKey: "025eb9ea95a4a39dc020b1ff9e5296191cdc4b9ae27ca15b81bcb0330206840ad5", privateKey: "5beae1f48013879b847d20a66f1060594f8516786ae1266ede68c5249454641b", address: "AbYpkBapS1efF2B6uoGzoxqkfV1R1ufGow", hashedSignature: "d8eaaf8b3e6f5cf3dd28212ba42e0c2f646c0579")]

//iOS_NEO.SAccount(name: "afer", wif: "KzJPNUQQTCBnx1oKBtTZKF2h5K1S9zVdgmEEJPcy7xPeSgQ3obpQ", publicKey: "025eb9ea95a4a39dc020b1ff9e5296191cdc4b9ae27ca15b81bcb0330206840ad5", privateKey: "5beae1f48013879b847d20a66f1060594f8516786ae1266ede68c5249454641b", address: "AbYpkBapS1efF2B6uoGzoxqkfV1R1ufGow", hashedSignature: "d8eaaf8b3e6f5cf3dd28212ba42e0c2f646c0579")

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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = NEOMainPageTableViewController.vc() {
            vc.sAccount = sAccountArray[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
