//
//  UILable + Extension.swift
//  FirstAssignment
//
//  Created by 최서경 on 1/28/24.
//

import UIKit

extension UILabel {
    func top10Design() {
        self.text = "TOP 10"
        self.font = .boldSystemFont(ofSize: 6)
        self.backgroundColor = .red
        self.textColor = .white
        self.textAlignment = .center
    }
    
    func watchDesign() {
        self.text = "지금 시청하기"
        self.font = .boldSystemFont(ofSize: 6)
        self.backgroundColor = .white
        self.textColor = .black
        self.textAlignment = .center
    }
    
    func episodeDesign() {
        self.text = "새로운 에피소드"
        self.font = .boldSystemFont(ofSize: 6)
        self.backgroundColor = .black
        self.textColor = .white
        self.textAlignment = .center
    }
}
