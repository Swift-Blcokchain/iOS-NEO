//
//  NEOReceiveViewController.swift
//  iOS-NEO
//
//  Created by afer on 2017/9/11.
//  Copyright © 2017年 afer. All rights reserved.
//

import UIKit

class NEOReceiveViewController: UIViewController {
    
    class func vc() -> NEOReceiveViewController? {
        let sd = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainvc = sd.instantiateViewController(withIdentifier: String(describing: NEOReceiveViewController.self))
        return mainvc as? NEOReceiveViewController
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
