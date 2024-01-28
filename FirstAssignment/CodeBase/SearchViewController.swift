//
//  SearchViewController.swift
//  FirstAssignment
//
//  Created by 최서경 on 1/27/24.
//

import UIKit
import SnapKit

#Preview {
    SearchViewController()
}

class SearchViewController: UIViewController {
    let searchBar = UISearchBar()
    
    let openButton = UIButton()
    let populationButton = UIButton()
    let topButton = UIButton()
    
    lazy var buttonList: [UIButton] = [openButton,
                                       populationButton,
                                       topButton]
    
    lazy var buttonStackView = UIStackView(arrangedSubviews: buttonList)

    let findLabel = UILabel()
    let statusLable = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        configureHierarchy()
        configureView()
        configureConstraints()
        buttonDesign()
        self.navigationItem.title = "NEW & HOT 검색"
    }
}

extension SearchViewController {
    func configureHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(buttonStackView)
        view.addSubview(findLabel)
        view.addSubview(statusLable)
    }
    
    func configureView() {
        searchBar.placeholder = "게임, 시리즈, 영화를 검색하세요..."
        
        buttonStackView.backgroundColor = .black
        
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillProportionally
        buttonStackView.spacing = 10
        
        openButton.clickedDesign()
        openButton.setTitle("공개 예정", for: .normal)
        openButton.setImage(UIImage(named: "blue"), for: .normal)
        
        populationButton.unclikedDesign()
        populationButton.setTitle("모두의 인기 콘텐츠", for: .normal)
        populationButton.setImage(UIImage(named: "pink"), for: .normal)
        
        topButton.unclikedDesign()
        topButton.setTitle("TOP10 시리즈", for: .normal)
        topButton.setImage(UIImage(named: "turquoise"), for: .normal)
                
        findLabel.text = "이런! 찾으시는 작품이 없습니다!"
        findLabel.textColor = .white
        findLabel.numberOfLines = 0
        findLabel.font = .boldSystemFont(ofSize: 20)
        
        statusLable.textColor = .gray
        statusLable.font = .systemFont(ofSize: 16)
        statusLable.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
    }
    
    func configureConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        findLabel.snp.makeConstraints { make in
            make.centerY.equalTo(view).multipliedBy(0.7)
            make.centerX.equalTo(view)
        }
        
        statusLable.snp.makeConstraints { make in
            make.top.equalTo(findLabel.snp.bottom).offset(20)
            make.centerX.equalTo(view)
        }
    }
    
    func buttonDesign() {
        var tag = 0
        for button in buttonList {
            button.tag = tag
            button.addTarget(self, action:  #selector(searchButtonClicked), for: .touchUpInside)
            tag += 1
        }
    }
    
    @objc func searchButtonClicked(sender: UIButton) {
        print(sender.tag)
        for button in buttonList {
            if button.tag == sender.tag {
                button.clickedDesign()
                setStatusLabel(status: sender.tag)
            } else {
                button.unclikedDesign()
            }
        }
    }
    
    func setStatusLabel(status: Int) {
        switch status {
        case 0:
            findLabel.text = "이런! 찾으시는 작품이 없습니다!"
        case 1:
            findLabel.text = "이런! 인기있는 작품이 없습니다!"
        case 2:
            findLabel.text = "이런!현재 TOP10 작품이 없습니다!"
        default:
            findLabel.text = "다른 작품을 찾아 보시는 것은 어떠실까요?"
            
        }
    }

}
