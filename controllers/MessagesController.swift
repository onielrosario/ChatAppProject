//
//  ViewController.swift
//  chatApp
//
//  Created by Oniel Rosario on 2/10/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit
import Firebase

class MessagesController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogOut))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "create"), style: .plain, target: self, action: #selector(createPressed))
        checkIfUserIsLoggedIn()
    }
    
    @objc private func createPressed() {
        let newMessageVC = NewMessageController()
        present(UINavigationController.init(rootViewController: newMessageVC), animated: true, completion: nil)
    }
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogOut), with: nil, afterDelay: 0)
        } else {
            let uid = Auth.auth().currentUser?.uid
            Database.database().reference().child("user").child(uid!).observe(.value, with: { (snapShot) in
                if let dictionary = snapShot.value as? [String: Any] {
                   self.navigationItem.title = dictionary["name"] as? String
                }

            }, withCancel: nil)
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

