//
//  Users.swift
//  chatApp
//
//  Created by Oniel Rosario on 2/11/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

struct Users {
    let name: String?
    let email: String?
    
    init(dictionary: [String: Any]) {
        self.name = dictionary["name"] as? String
        self.email = dictionary["email"] as? String
    }
}
