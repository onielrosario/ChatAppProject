//
//  NewMessageController.swift
//  chatApp
//
//  Created by Oniel Rosario on 2/11/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class NewMessageController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(canceled))
    }
    
    @objc private func canceled() {
        dismiss(animated: true, completion: nil)
    }
}
