//
//  LoginViewController.swift
//  chatApp
//
//  Created by Oniel Rosario on 2/10/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    let inputContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let profileimage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "placeholder-image")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        return button
        
    }()
    
    @objc func handleRegister() {
        guard let email = emailTF.text,
            let password = passwordTF.text,
        let name = nameTF.text else { return }
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                print(error)
                return
        }
        
        let ref = Database.database().reference(fromURL: "https://chatproject-e0cc3.firebaseio.com/")
            let userReference = ref.child("user")
        let values = ["name": name, "email": email]
        userReference.updateChildValues(values, withCompletionBlock: { (error, ref) in
            if error != nil {
                print(error.debugDescription)
                return
            }
            print("saved user successfully")
        })
    })
    }
    
    let nameTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Name"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let nameSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "E-mail"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let emailSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let passwordSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        view.addSubview(inputContainerView)
        view.addSubview(loginButton)
        
        
        setupContainerView()
        setupbuttonContrains()
        
    }
    
    func setupContainerView() {
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        //add subviews
        inputContainerView.addSubview(nameTF)
        inputContainerView.addSubview(nameSeparator)
        inputContainerView.addSubview(emailTF)
        inputContainerView.addSubview(emailSeparator)
        inputContainerView.addSubview(passwordTF)
        inputContainerView.addSubview(passwordSeparator)
        
        
        //constrains
        
        //name TF
        nameTF.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        nameTF.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        nameTF.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        nameTF.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        
        //name sepatator
        nameSeparator.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        nameSeparator.topAnchor.constraint(equalTo: nameTF.bottomAnchor).isActive = true
        nameSeparator.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        nameSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        //email TF
        emailTF.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        emailTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor).isActive = true
        emailTF.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        emailTF.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        
        //email sepatator
        emailSeparator.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        emailSeparator.topAnchor.constraint(equalTo: emailTF.bottomAnchor).isActive = true
        emailSeparator.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        emailSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //password TF
        passwordTF.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        passwordTF.topAnchor.constraint(equalTo: emailTF.bottomAnchor).isActive = true
        passwordTF.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        passwordTF.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        
        //password sepatator
        passwordSeparator.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        passwordSeparator.topAnchor.constraint(equalTo: emailTF.bottomAnchor).isActive = true
        passwordSeparator.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        passwordSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
    }
    
    func  setupbuttonContrains() {
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 12).isActive = true
        loginButton.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
