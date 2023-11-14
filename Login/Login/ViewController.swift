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
    @IBOutlet private weak var envelopeImageView: UIImageView!
    @IBOutlet private weak var lockImageView: UIImageView!
    
    //MARK: - Properties
    private let activeColor = UIColor(named: "activeColor") ?? UIColor.gray
    private let shadowColor = (UIColor(named: "activeColor") ?? UIColor.black).cgColor
    private var email = "" {
        didSet {
            loginButton.isUserInteractionEnabled = !(email.isEmpty || password.isEmpty)
            loginButton.backgroundColor = !(email.isEmpty || password.isEmpty) ? activeColor : .gray
            loginButton.layer.shadowColor = !(email.isEmpty || password.isEmpty) ? shadowColor : UIColor.gray.cgColor
        }
    }
    private var password = "" {
        didSet {
            loginButton.isUserInteractionEnabled = !(email.isEmpty || password.isEmpty)
            loginButton.backgroundColor = !(email.isEmpty || password.isEmpty) ? activeColor : .gray
            loginButton.layer.shadowColor = !(email.isEmpty || password.isEmpty) ? shadowColor : UIColor.gray.cgColor
        }
    }
    private let mockEmail = "abc@gmail.com"
    private let mockPassword = "123456"
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButton()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.becomeFirstResponder()
    }
    
    //MARK: - IBAction
    @IBAction private func loginButtonAction(_ sender: UIButton) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        if email.isEmpty {
            makeErrorField(textField: emailTextField)
        }
        
        if password.isEmpty {
            makeErrorField(textField: passwordTextField)
        }
        
        if email == mockEmail,
           password == mockPassword {
            performSegue(withIdentifier: "goToHomePage", sender: sender)
        } else {
            let alert = UIAlertController(title: "Error".localized,
                                          message: "Wrong password or e-mail".localized,
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "OK".localized, style: .default)
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
    
    @IBAction private func signupButton(_ sender: UIButton) { }
    
    //MARK: - Methods
    private func configureButton() {
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        loginButton.layer.shadowRadius = 6
        loginButton.layer.shadowOpacity = 0.8
        //        loginButton.layer.shadowColor = UIColor(red: 153/255, green: 44/255, blue: 91/255, alpha: 1.0).cgColor
        // or
        loginButton.layer.shadowColor = UIColor.gray.cgColor
        loginButton.layer.cornerRadius = 5
        
        loginButton.isUserInteractionEnabled = false
        loginButton.backgroundColor = .gray
       
    }
}

//Extension
extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !text.isEmpty else { return }
        switch textField {
        case emailTextField:
            let isValidEmail = check(email: text)
            
            if isValidEmail {
                email = text
                envelopeImageView.tintColor = .systemGray5
                underscoreEmail.backgroundColor = .systemGray5
            } else {
                email = ""
                makeErrorField(textField: textField)
            }
        case passwordTextField:
            let isValidPassword = check(password: text)
            
            if isValidPassword {
                password = text
                lockImageView.tintColor = .systemGray5
                underscorePassword.backgroundColor = .systemGray5
            } else {
                password = ""
                makeErrorField(textField: textField)
            }
        default:
            print("Unknown textField")
        }
    }
    
    //Check
    private func check(email: String) -> Bool {
        email.contains("@") && email.contains(".")
    }
    
    private func check(password: String) -> Bool {
        password.count >= 4
    }
    
    //Error
    private func makeErrorField(textField: UITextField) {
        switch textField {
        case emailTextField:
            envelopeImageView.tintColor = activeColor
            underscoreEmail.backgroundColor = activeColor
        case passwordTextField:
            lockImageView.tintColor = activeColor
            underscorePassword.backgroundColor = activeColor
        default:
            print("Unknown textField")
            
        }
    }
}


