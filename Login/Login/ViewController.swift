//
//  ViewController.swift
//  Login
//
//  Created by User on 10.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var signupButton: UIButton!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var underscoreEmail: UIView!
    @IBOutlet private weak var underscorePassword: UIView!
    @IBOutlet private weak var missingAccount: UILabel!
    @IBOutlet private weak var emailImageView: UIImageView!
    @IBOutlet private weak var lockImageView: UIImageView!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButton()
    }
    
    //MARK: - IBAction
    @IBAction private func loginButtonAction(_ sender: UIButton) {
        print("login")
    }
    @IBAction private func signupButton(_ sender: UIButton) {
        print("signup")
    }
    
    //MARK: - Methods
    private func configureButton() {
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        loginButton.layer.shadowRadius = 6
        loginButton.layer.shadowOpacity = 0.8
        //        loginButton.layer.shadowColor = UIColor(red: 153/255, green: 44/255, blue: 91/255, alpha: 1.0).cgColor
        // or
        loginButton.layer.shadowColor = (UIColor(named: "shadow") ?? UIColor.black).cgColor
        loginButton.layer.cornerRadius = 5
    }
    
}

