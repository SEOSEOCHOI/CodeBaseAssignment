//
//  LogIn.swift
//  FirstAssignment
//
//  Created by 최서경 on 2/26/24.
//

import UIKit
import SnapKit

class LogInView: UIView {
    let emailTextField = UITextField()
    let passwordTexrtField = UITextField()
    
    let logInButton = UIButton()
    let messageLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureConstraits()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        addSubview(emailTextField)
        addSubview(passwordTexrtField)
        addSubview(logInButton)
        addSubview(messageLabel)
    }
    
    func configureView() {
        
        logInButton.backgroundColor = .white
        logInButton.setTitle("회원가입", for: .normal)
        logInButton.setTitleColor(.black, for: .normal)
        logInButton.layer.cornerRadius = 5
        
        messageLabel.text = "추가 정보 입력"
        messageLabel.textColor = .white
        messageLabel.font = .systemFont(ofSize: 13)
        
        registerTextFieldDesign(emailTextField, "이메일 주소")
        registerTextFieldDesign(passwordTexrtField, "비밀번호")
    }
    
    func configureConstraits() {
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(100)
            make.height.equalTo(35)
        }
        
        passwordTexrtField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.height.equalTo(35)
        }
        
        logInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(passwordTexrtField.snp.bottom).offset(20)
            make.height.equalTo(35)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(logInButton.snp.bottom).offset(20)
            make.height.equalTo(35)
        }
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
