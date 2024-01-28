//
//  RegisterViewController.swift
//  FirstAssignment
//
//  Created by 최서경 on 12/27/23.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet var registerView: UIView!
    @IBOutlet var titleImageView: UIImageView!
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTexrtField: UITextField!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var placeTextField: UITextField!
    @IBOutlet var recommendCodeTextField: UITextField!
    
    @IBOutlet var registerButton: UIButton!
    
    @IBOutlet var onSwitch: UISwitch!
    @IBOutlet var messageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        registerView.backgroundColor = .black
        
        titleImageView.image = UIImage(named: "wordmark")
        titleImageView.contentMode = .scaleAspectFit
        
        registerTextFieldDesign(emailTextField, "이메일 주소 또는 비밀번호")
        registerTextFieldDesign(passwordTexrtField, "비밀번호")
        registerTextFieldDesign(nicknameTextField, "닉네임")
        registerTextFieldDesign(placeTextField, "위치")
        registerTextFieldDesign(recommendCodeTextField, "추천 코드 입력")

        
        registerButton.backgroundColor = .white
        registerButton.setTitle("회원가입", for: .normal)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.layer.cornerRadius = 5
        
        messageLabel.text = "추가 정보 입력"
        messageLabel.textColor = .white
        messageLabel.font = .systemFont(ofSize: 13)
        
        onSwitch.onTintColor = .systemRed
    }

    @IBAction func onswitchTapped(_ sender: UISwitch) {
        if onSwitch.isOn == true {
            nicknameTextField.isHidden = false
            placeTextField.isHidden = false
            recommendCodeTextField.isHidden = false
        } else {
            nicknameTextField.isHidden = true
            placeTextField.isHidden = true
            recommendCodeTextField.isHidden = true
        }
    }
    
    @IBAction func RegisterButtonClicked(_ sender: UIButton) {
        view.endEditing(true)
        
        /*
         if type(of: recommendCodeTextField.text) != Int.self {
             messageLabel.text = "추천코드는 숫자만 입력 가능합니다."
         } else {
             messageLabel.text = ""
         }
         
         if ((passwordTexrtField.text?.isEmpty) != true) {
             if passwordTexrtField.text!.count < 6 {
                 messageLabel.text = "비밀번호는 6자리 이상 입력헤 주세요."
             }
         } else {
                 messageLabel.text = ""
         }
         
         if ((emailTextField.text?.isEmpty) == true && (passwordTexrtField.text?.isEmpty) == true) {
             messageLabel.text = "이메일과 비밀번호를 입력해 주세요."
         } else if ((emailTextField.text?.isEmpty) != true && (passwordTexrtField.text?.isEmpty) == true) {
             messageLabel.text = "비밀번호를 입력해 주세요."
         } else if ((emailTextField.text?.isEmpty) == true && (passwordTexrtField.text?.isEmpty) != true) {
             messageLabel.text = "이메일을 입력해 주세요."
         } else {
                 messageLabel.text = ""
         }
                               */
    }
    
    func registerTextFieldDesign(_ textField: UITextField, _ placeholder: String) {
        textField.backgroundColor = .darkGray
        textField.placeholder = placeholder
        textField.textColor = .white
        if textField == emailTextField {
            emailTextField.keyboardType = .emailAddress
        } else if textField == passwordTexrtField {
            passwordTexrtField.isSecureTextEntry = true
            passwordTexrtField.textContentType = .oneTimeCode
        }
    }
}
