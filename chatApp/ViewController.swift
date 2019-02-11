//
//  ViewController.swift
//  chatApp
//
//  Created by Oniel Rosario on 2/10/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogOut))
        
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogOut), with: nil, afterDelay: 0)
        }
    }

    @objc func handleLogOut() {
        do {
           try Auth.auth().signOut()
        } catch {
            print(error)
        }
        
        let loginVC = LoginViewController()
        present(loginVC, animated: true, completion: nil)
    }
}

