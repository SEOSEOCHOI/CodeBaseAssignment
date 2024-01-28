//
//  SaveContentViewController.swift
//  FirstAssignment
//
//  Created by 최서경 on 1/27/24.
//

import UIKit
import SnapKit

#Preview {
    SaveContentViewController()
}

class SaveContentViewController: UIViewController {
    
    let saveLabel = UILabel()
    let commentLabel = UILabel()
    let dummyImageView = UIImageView()
    let setButton = UIButton()
    let findButton = UIButton()
    let listButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        configureHierarchy()
        configureView()
        configureConstraits()
        self.navigationItem.title = "저장한 콘텐츠 목록"
    }
}

extension SaveContentViewController {
    func configureHierarchy() {
        view.addSubview(saveLabel)
        view.addSubview(commentLabel)
        view.addSubview(dummyImageView)
        view.addSubview(setButton)
        view.addSubview(findButton)
        view.addSubview(listButton)
    }
    
    func configureView() {
        saveLabel.textColor = .white
        saveLabel.text = "'나만의 자동 저장' 기능"
        saveLabel.font = .boldSystemFont(ofSize: 17)
        
        commentLabel.text = "취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다. 디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요."
        commentLabel.numberOfLines = 3
        commentLabel.textColor = .lightGray
        commentLabel.font = .systemFont(ofSize: 15)
        commentLabel.textAlignment = .center
        
        dummyImageView.backgroundColor = .red
        dummyImageView.image = UIImage(named: "dummy")
        dummyImageView.contentMode = .scaleAspectFill
        
        setButton.backgroundColor = .systemIndigo
        setButton.setTitle("설정하기", for: .normal)
        setButton.setTitleColor(.white, for: .normal)
        setButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
        setButton.buttonRadius()
        
        
        findButton.backgroundColor = .blue
        findButton.setTitle("저장 가능한 콘텐츠 살펴보기", for: .normal)
        findButton.backgroundColor = .white
        findButton.setTitleColor(.black, for: .normal)
        findButton.titleLabel?.font = .boldSystemFont(ofSize: 15)

    }
    
    func configureConstraits() {
        saveLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).multipliedBy(0.3)
        }
        
        commentLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(saveLabel.snp.bottom).offset(20)
            make.width.equalTo(view).inset(20)
        }
        
        dummyImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(commentLabel.snp.bottom).offset(20)
            make.width.equalTo(view).multipliedBy(0.6)
            make.height.equalTo(dummyImageView.snp.width).multipliedBy(1)
        }
        
        setButton.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(dummyImageView.snp.bottom).offset(50)
            make.leading.equalTo(dummyImageView).offset(-20)
            make.trailing.equalTo(dummyImageView).offset(20)
            make.height.equalTo(40)
        }
        
        findButton.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(setButton.snp.bottom).offset(20)
            make.leading.trailing.equalTo(setButton).inset(20)
            make.height.equalTo(40)
        }
    }
}
