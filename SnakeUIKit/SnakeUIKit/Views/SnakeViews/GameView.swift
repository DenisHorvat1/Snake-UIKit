//
//  GameView.swift
//  SnakeUIKit
//
//  Created by Denis Horvat  on 01.09.2023.
//

import UIKit

class GameView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGameView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupGameView()
    }
    
    func setupGameView() {
        backgroundColor = .white
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.gray.cgColor
    }
}
