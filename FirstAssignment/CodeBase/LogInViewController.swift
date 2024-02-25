//
//  LogInViewController.swift
//  FirstAssignment
//
//  Created by 최서경 on 2/26/24.
//

import UIKit

class LogInViewController: UIViewController {
    let mainView = LogInView()
    let viewModel = LogInViewModel()
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        self.navigationItem.title = "로그인"
        
        addTarget()
        bindData()
    }
    
    func addTarget() {
        mainView.emailTextField.addTarget(self, action: #selector(emailChanged), for: .editingChanged)
        
        mainView.passwordTexrtField.addTarget(self, action: #selector(passwordChanged), for: .editingChanged)
        
        mainView.logInButton.addTarget(self, action: #selector(logInButtonClicked), for: .touchUpInside)
    }
    
    func bindData() {
        viewModel.outputVlidation.bind { value in
            self.mainView.messageLabel.text = value
        }
        
        viewModel.outputValidationColor.bind { value in
            self.mainView.messageLabel.textColor = value ? .green : .red
            if value == true {
                self.mainView.logInButton.isEnabled = true
            } else {
                self.mainView.logInButton.isEnabled = false
            }
        }
    }
    
    @objc func emailChanged() {
        guard let text = mainView.emailTextField.text else { return }
        viewModel.inputEmail.value = text
    }
    
    @objc func passwordChanged() {
        guard let text = mainView.passwordTexrtField.text else { return }
        viewModel.inputPassword.value = text
    }
    
    
    @objc func logInButtonClicked() {
        let vc = LoadViewController()
        self.mainView.logInButton.isEnabled = true
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
