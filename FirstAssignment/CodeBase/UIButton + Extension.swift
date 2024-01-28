//
//  UIButton + Extension.swift
//  FirstAssignment
//
//  Created by 최서경 on 1/27/24.
//

import UIKit


extension UIButton {
    func buttonRadius() {
        DispatchQueue.main.async {
            self.layer.cornerRadius = self.frame.height * 0.1
        }
    }
    func clickedDesign() {
        DispatchQueue.main.async {
            self.layer.cornerRadius = self.frame.height * 0.4
        }
        self.titleLabel?.font = .systemFont(ofSize: 13)
        self.titleLabel?.textAlignment = .right
        self.backgroundColor = .white
        self.setTitleColor(.black, for: .normal)
    }
    
    func unclikedDesign() {
        self.titleLabel?.font = .systemFont(ofSize: 13)
        self.titleLabel?.textAlignment = .right
        self.backgroundColor = .black
        self.setTitleColor(.white, for: .normal)
    }
    
}
