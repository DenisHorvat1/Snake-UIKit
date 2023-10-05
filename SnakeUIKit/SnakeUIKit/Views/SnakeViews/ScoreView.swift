//
//  ScoreView.swift
//  SnakeUIKit
//
//  Created by Denis Horvat  on 01.09.2023.
//

import UIKit

class ScoreView: UIView {
    
    var scoreLabel = UILabel()
    var topScoreLabel = UILabel()
    
    init(score: Int, topScore: Int){
        super.init(frame: CGRect.zero)
        
        self.scoreLabel.text = "\(score)"
        self.topScoreLabel.text = "\(topScore)"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScoreView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupScoreView()
    }
    
    func setupScoreView() {
        backgroundColor = .black
        
        scoreLabel.text = "Score: 0"
        scoreLabel.textColor = .white
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scoreLabel)

        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: topAnchor),
            scoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            scoreLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        topScoreLabel.text = ""
        topScoreLabel.textColor = .white
        topScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(topScoreLabel)

        NSLayoutConstraint.activate([
            topScoreLabel.topAnchor.constraint(equalTo: topAnchor),
            topScoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            topScoreLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    func setScore(score: Int, topScore: Int){
        self.scoreLabel.text = "Score: \(score)"
        self.topScoreLabel.text = "Top score: \(topScore)"
        
    }
}
