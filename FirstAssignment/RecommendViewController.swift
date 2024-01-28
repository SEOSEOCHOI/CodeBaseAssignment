//
//  FindViewController.swift
//  FirstAssignment
//
//  Created by 최서경 on 12/27/23.
//

import UIKit

class RecommendViewController: UIViewController {

    @IBOutlet var openButton: UIButton!
    @IBOutlet var populationButton: UIButton!
    @IBOutlet var topButton: UIButton!
    
    @IBOutlet var findLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonDesign(openButton, active: true )
        buttonDesign(populationButton, active: false)
        buttonDesign(topButton, active: false)
    }
    
    
    @IBAction func openButtonClicked(_ sender: UIButton) {
        buttonDesign(openButton, active: true)
        buttonDesign(populationButton, active: false)
        buttonDesign(topButton, active: false)

        findLabel.text = "이런! 찾으시는 작품이 없습니다!"
    }
    
    @IBAction func populationButtonClicked(_ sender: UIButton) {
        buttonDesign(openButton, active: false)
        buttonDesign(populationButton, active: true)
        buttonDesign(topButton, active: false)
        
        findLabel.text = "이런! 인기있는 작품이 없습니다!"
    }
    
    @IBAction func topButtonClicked(_ sender: UIButton) {
        buttonDesign(openButton, active: false)
        buttonDesign(populationButton, active: false)
        buttonDesign(topButton, active: true)
    
        findLabel.text = "이런!현재 TOP10 작품이 없습니다!"
    }
    
    func buttonDesign(_ button: UIButton, active: Bool) {
        button.layer.cornerRadius = 12
        if active == true {
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
        } else {
            button.backgroundColor = .black
            button.setTitleColor(.white, for: .normal)
        }
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
    }
}
