//
//  UIImageView + Extension.swift
//  FirstAssignment
//
//  Created by 최서경 on 1/27/24.
//

import UIKit

extension UIImageView {
    func setImageViewRadius() {
        DispatchQueue.main.async {
            self.layer.cornerRadius = self.frame.width * 0.05
            self.layer.masksToBounds = true
        }
    }
}
