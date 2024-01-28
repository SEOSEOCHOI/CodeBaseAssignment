//
//  MainViewController.swift
//  FirstAssignment
//
//  Created by 최서경 on 12/27/23.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var mainPosterImageView: UIImageView!
    
    @IBOutlet var firstPosterImageView: UIImageView!
    @IBOutlet var secondPosterImageView: UIImageView!
    @IBOutlet var thirdPosterImageView: UIImageView!
    
    @IBOutlet var playButton: UIButton!
    @IBOutlet var listButton: UIButton!
    
    @IBOutlet var firstPosterTopLabel: UILabel!
    @IBOutlet var firstPosterWatchLabel: UILabel!
    @IBOutlet var firstPosterEpisodeLabel: UILabel!
    
    @IBOutlet var secondPosterTopLabel: UILabel!
    @IBOutlet var secondPosterWatchLabel: UILabel!
    @IBOutlet var secondPosterEpisodeLabel: UILabel!
    
    @IBOutlet var thirdPosterTopLabel: UILabel!
    @IBOutlet var thirdPosterWatchLabel: UILabel!
    @IBOutlet var thirdPosterEpisodeLabel: UILabel!
    
    
    @IBOutlet var firstPosterStackView: UIStackView!
    @IBOutlet var secondPosterStackView: UIStackView!
    @IBOutlet var thirdPosterStackView: UIStackView!
    
    let posterList: [String] = ["노량", "더퍼스트슬램덩크", "밀수", "범죄도시3", "서울의봄", "스즈메의문단속", "아바타물의길", "오펜하이머", "육사오", "콘크리트유토피아"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        posterDesign(mainPosterImageView)
        posterDesign(firstPosterImageView)
        posterDesign(secondPosterImageView)
        posterDesign(thirdPosterImageView)
        
        playButton.layer.cornerRadius = 5
        listButton.layer.cornerRadius = 5
    }
    
    @IBAction func listButtonClicked(_ sender: UIButton) {
        posterRandomSetting(mainPosterImageView)
        posterRandomSetting(firstPosterImageView)
        posterRandomSetting(secondPosterImageView)
        posterRandomSetting(thirdPosterImageView)
        
        posterLabelIsHidden(top10: firstPosterTopLabel, watch: firstPosterWatchLabel, episode: firstPosterEpisodeLabel)
        posterLabelIsHidden(top10: secondPosterTopLabel, watch: secondPosterWatchLabel, episode: secondPosterEpisodeLabel)
        posterLabelIsHidden(top10: thirdPosterTopLabel, watch: thirdPosterWatchLabel, episode: thirdPosterEpisodeLabel)
    }
    
    func posterDesign(_ poster: UIImageView) {
        if poster == mainPosterImageView {
            poster.layer.cornerRadius = 20
        } else {
            poster.layer.cornerRadius = 8
        }
        poster.layer.borderWidth = 1
        poster.layer.borderColor = UIColor.white.cgColor
    }
    
    func posterRandomSetting(_ poster: UIImageView) {
        poster.image = UIImage(named: posterList.randomElement()!)
    }
    
    func posterLabelIsHidden(top10: UILabel, watch: UILabel, episode: UILabel) {
        top10.isHidden = Int.random(in: 0...1) != 0
        watch.isHidden = Int.random(in: 0...1) != 0
        episode.isHidden = Int.random(in: 0...1) != 0
    }
}
