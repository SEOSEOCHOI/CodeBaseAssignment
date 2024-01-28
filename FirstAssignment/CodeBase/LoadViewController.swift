//
//  MainViewController.swift
//  FirstAssignment
//
//  Created by 최서경 on 1/27/24.
//

import UIKit
import SnapKit


#Preview {
    LoadViewController()
}

class LoadViewController: UIViewController {
    
    let posterList: [String] = ["노량", "더퍼스트슬램덩크", "밀수", "범죄도시3", "서울의봄", "스즈메의문단속", "아바타물의길", "오펜하이머", "육사오", "콘크리트유토피아"]
    
    let mainView = UIView()
    let mainPosterImageView = UIImageView()
    let expainLabel = UILabel()
    let playButton = UIButton()
    let listButton = UIButton()
    lazy var buttonStackView = UIStackView(arrangedSubviews:
                                            [playButton,
                                             listButton])
    let contentsLabel = UILabel()
    
    let firstImageView = UIImageView()
    let firstPosterTopLabel = UILabel()
    let firstPosterWatchLabel = UILabel()
    let firstPosterEpisodeLabel = UILabel()
    
    let secondImageView = UIImageView()
    let secondPosterTopLabel = UILabel()
    let secondPosterWatchLabel = UILabel()
    let secondPosterEpisodeLabel = UILabel()
    
    let thirdImageView = UIImageView()
    let thirdPosterTopLabel = UILabel()
    let thirdPosterWatchLabel = UILabel()
    let thirdPosterEpisodeLabel = UILabel()
    
    lazy var posterStackView = UIStackView(arrangedSubviews: [firstImageView,
                                                              secondImageView,
                                                              thirdImageView])
    
    
    lazy var firstPosterStackView = UIStackView(arrangedSubviews: [firstPosterTopLabel,
                                                 firstPosterWatchLabel,
                                                 firstPosterEpisodeLabel])
    lazy var secondPosterStackView = UIStackView(arrangedSubviews: [secondPosterTopLabel,
                                                                   secondPosterWatchLabel,
                                                                   secondPosterEpisodeLabel])
    lazy var thirdPosterStackView = UIStackView(arrangedSubviews: [thirdPosterTopLabel,
                                                                  thirdPosterWatchLabel,
                                                                  thirdPosterEpisodeLabel])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        self.navigationItem.title = "고래밥님"

        configureHierarchy()
        configureView()
        configureConstraints()
    }
}
extension LoadViewController {
    func configureHierarchy() {
        view.addSubview(mainView)
        mainView.addSubview(mainPosterImageView)
        mainView.addSubview(expainLabel)
        mainView.addSubview(buttonStackView)
        mainView.addSubview(contentsLabel)
        mainView.addSubview(posterStackView)
        mainView.addSubview(firstPosterStackView)
        mainView.addSubview(secondPosterStackView)
        mainView.addSubview(thirdPosterStackView)
    }
    
    func configureView() {
        mainPosterImageView.image = UIImage(named: posterList[0])
        
        expainLabel.text = "응원하고픈 • 흥미진진 • 사극 • 전투 • 한국작품"
        expainLabel.textColor = .white
        
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 10
        
        playButton.setTitle(" 재생", for: .normal)
        playButton.setTitleColor(.black, for: .normal)
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.tintColor = .black
        playButton.backgroundColor = .white
        playButton.buttonRadius()
        
        listButton.setTitle(" 내가 찜한 리스트", for: .normal)
        listButton.setTitleColor(.white, for: .normal)
        listButton.setImage(UIImage(systemName: "plus"), for: .normal)
        listButton.tintColor = .white
        listButton.backgroundColor = .gray
        listButton.buttonRadius()
        
        contentsLabel.text = "지금 뜨는 콘텐츠"
        contentsLabel.textColor = .white
        contentsLabel.font = .systemFont(ofSize: 13)
        
        posterStackView.spacing = 10
        posterStackView.distribution = .fillEqually
        
        
        firstPosterStackView.axis = .vertical
        firstPosterTopLabel.top10Design()
        firstPosterWatchLabel.watchDesign()
        firstPosterEpisodeLabel.episodeDesign()
        
        secondPosterStackView.axis = .vertical
        secondPosterTopLabel.top10Design()
        secondPosterWatchLabel.watchDesign()
        secondPosterEpisodeLabel.episodeDesign()
        
        thirdPosterStackView.axis = .vertical
        thirdPosterTopLabel.top10Design()
        thirdPosterWatchLabel.watchDesign()
        thirdPosterWatchLabel.episodeDesign()
        
        posterRandomSetting(mainPosterImageView)
        posterRandomSetting(firstImageView)
        posterRandomSetting(secondImageView)
        posterRandomSetting(thirdImageView)
        
        posterLabelIsHidden(top10: firstPosterTopLabel, watch: firstPosterWatchLabel, episode: firstPosterEpisodeLabel)
        
        posterLabelIsHidden(top10: secondPosterTopLabel, watch: secondPosterWatchLabel, episode: secondPosterEpisodeLabel)
        
        posterLabelIsHidden(top10: thirdPosterTopLabel, watch: thirdPosterWatchLabel, episode: thirdPosterEpisodeLabel)
    }
    
    func configureConstraints() {
        mainView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(50)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalToSuperview().multipliedBy(0.55)
        }
        
        mainPosterImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        expainLabel.snp.makeConstraints { make in
            make.bottom.equalTo(buttonStackView.snp.top).offset(-20)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.centerX.equalTo(mainView)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.bottom.equalTo(-20)
            make.centerX.equalTo(view)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(35)
        }
        
        contentsLabel.snp.makeConstraints { make in
            make.leading.equalTo(mainView)
            make.top.equalTo(mainView.snp.bottom).offset(20)
        }
        
        posterStackView.snp.makeConstraints { make in
            make.top.equalTo(contentsLabel).offset(30)
            
            make.horizontalEdges.equalTo(mainView)
            make.height.equalTo(posterStackView.snp.width).multipliedBy(100.0 / 200.0)
        }
        
        firstPosterStackView.snp.makeConstraints { make in
            make.centerX.equalTo(firstImageView)
            make.bottom.equalTo(firstImageView.snp.bottom)
        }
        
        secondPosterStackView.snp.makeConstraints { make in
            make.centerX.equalTo(secondImageView)
            make.bottom.equalTo(secondImageView.snp.bottom)
        }
        
        thirdPosterStackView.snp.makeConstraints { make in
            make.centerX.equalTo(thirdImageView)
            make.bottom.equalTo(thirdImageView.snp.bottom)
        }
        
    }
}

extension LoadViewController {
    func posterRandomSetting(_ poster: UIImageView) {
        poster.image = UIImage(named: posterList.randomElement()!)
        poster.setImageViewRadius()
    }
    
    func posterLabelIsHidden(top10: UILabel, watch: UILabel, episode: UILabel) {
        top10.isHidden = Int.random(in: 0...1) != 0
        watch.isHidden = Int.random(in: 0...1) != 0
        episode.isHidden = Int.random(in: 0...1) != 0
    }
}
