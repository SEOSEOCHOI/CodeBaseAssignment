//
//  SaveViewController.swift
//  FirstAssignment
//
//  Created by 최서경 on 12/27/23.
//

import UIKit

class SaveViewController: UIViewController {
    
    
    @IBOutlet var saveLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    @IBOutlet var dummyImageView: UIImageView!
    
    @IBOutlet var setButton: UIButton!
    @IBOutlet var findButton: UIButton!
    @IBOutlet var listButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveLabel.text = "'나만의 자동 저장' 기능"
        saveLabel.textColor = .white
        saveLabel.font = .boldSystemFont(ofSize: 22)
        saveLabel.textAlignment = .center
        
        /*
        commentLabel.text = """
취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다.
디바이스에 언제나 시청할 콘텐츠가 준비되니
 지루할 틈이 없어요.
""" */
        commentLabel.text = "취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다. 디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요."
        
        commentLabel.numberOfLines = 3
        commentLabel.textColor = .lightGray
        commentLabel.font = .systemFont(ofSize: 15)
        commentLabel.textAlignment = .center
        
        dummyImageView.image = UIImage(named: "dummy")
        dummyImageView.contentMode = .scaleAspectFit
        
        buttonDesign(setButton, title: "설정하기")
        buttonDesign(findButton, title: "저장 가능한 콘텐츠 살펴보기")
        buttonDesign(listButton, title: "내가 찜한 리스트")
    }
    
    func buttonDesign(_ button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = 5
        if button == setButton {
            button.backgroundColor = .systemIndigo
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 18)

        } else if button == findButton {
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        } else {
            button.backgroundColor = .lightGray
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 15)
            button.setImage(UIImage(systemName: "eraser.fill"), for: .normal)
            button.tintColor = .white
        }
    }
}
