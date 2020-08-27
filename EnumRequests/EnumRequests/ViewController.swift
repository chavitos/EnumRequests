//
//  ViewController.swift
//  EnumRequests
//
//  Created by Tiago Chaves on 22/08/20.
//  Copyright © 2020 105 Developers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NetworkManager.request(.user(userId: "EvXSjRCdYryxUp3j1Akj")) { (data, error) in
            do {
                guard let data = data else { return }
                let user = try User.decode(from: data)
                print(user.greeting)
            } catch let error {
                print(error)
            }
        }
    }
}

