//
//  LogInViewModel.swift
//  FirstAssignment
//
//  Created by 최서경 on 2/26/24.
//

import Foundation

class LogInViewModel {
    var inputEmail = Observable("")
    var inputPassword = Observable("")
    
    var outputVlidation = Observable("")
    var outputValidationColor = Observable(false)
    
    init() {
        print("viewModel init")
        
        inputEmail.bind { value in
            print("emailValidation")
            self.validation(email: value,
                            pw: self.inputPassword.value)
        }
        
        inputPassword.bind { value in
            print("password Validation")
            self.validation(email: self.inputEmail.value,
                            pw: value)
        }
    }
    
    private func validation(email: String, pw: String) {
        if email.count >= 3 && pw.count >= 6 {
            outputVlidation.value = "로그인 가능합니다."
            outputValidationColor.value = true
        } else {
            outputVlidation.value = "이메일 3자, 비밀번호 6자리 이상 입력해 주세요."
            outputValidationColor.value = false
        }
    }
}
