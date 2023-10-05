//
//  ButtonsView.swift
//  SnakeUIKit
//
//  Created by Denis Horvat  on 01.09.2023.
//

import UIKit

class ButtonsView: UIView {
    
    var direction: Direction = .right
    
    var upButton = UIButton()
    var downButton = UIButton()
    var leftButton = UIButton()
    var rightButton = UIButton()
    
    var buttonsSize:CGFloat = 80
    var spaceSize:CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
}

extension ButtonsView {
    
    func setupView() {
        backgroundColor = .black
        
        addSubview(upButton)
        addSubview(downButton)
        addSubview(leftButton)
        addSubview(rightButton)
        
        upButton.translatesAutoresizingMaskIntoConstraints = false
        downButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        
        upButton.setTitle("↑", for: .normal)
        downButton.setTitle("↓", for: .normal)
        leftButton.setTitle("←", for: .normal)
        rightButton.setTitle("→", for: .normal)
        
        upButton.backgroundColor = .white
        downButton.backgroundColor = .white
        leftButton.backgroundColor = .white
        rightButton.backgroundColor = .white
        
        upButton.layer.cornerRadius = 30
        downButton.layer.cornerRadius = 30
        leftButton.layer.cornerRadius = 30
        rightButton.layer.cornerRadius = 30
        
        upButton.setTitleColor(.black, for: .normal)
        downButton.setTitleColor(.black, for: .normal)
        leftButton.setTitleColor(.black, for: .normal)
        rightButton.setTitleColor(.black, for: .normal)
        
        upButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        downButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        
        NSLayoutConstraint.activate([
            upButton.heightAnchor.constraint(equalToConstant: buttonsSize),
            upButton.widthAnchor.constraint(equalToConstant: buttonsSize),
            upButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            upButton.topAnchor.constraint(equalTo: topAnchor, constant: spaceSize),
            
            downButton.heightAnchor.constraint(equalToConstant: buttonsSize),
            downButton.widthAnchor.constraint(equalToConstant: buttonsSize),
            downButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            downButton.topAnchor.constraint(equalTo: upButton.bottomAnchor, constant: spaceSize),
            
            leftButton.heightAnchor.constraint(equalToConstant: buttonsSize),
            leftButton.widthAnchor.constraint(equalToConstant: buttonsSize),
            leftButton.rightAnchor.constraint(equalTo: downButton.leftAnchor, constant: -spaceSize),
            leftButton.centerYAnchor.constraint(equalTo: downButton.centerYAnchor),
            
            rightButton.heightAnchor.constraint(equalToConstant: buttonsSize),
            rightButton.widthAnchor.constraint(equalToConstant: buttonsSize),
            rightButton.centerYAnchor.constraint(equalTo: downButton.centerYAnchor),
            rightButton.leftAnchor.constraint(equalTo: downButton.rightAnchor, constant: spaceSize)
            
        ])
        
        upButton.addTarget(self, action: #selector(upButtonPressed), for: .touchUpInside)
        downButton.addTarget(self, action: #selector(downButtonPressed), for: .touchUpInside)
        leftButton.addTarget(self, action: #selector(leftButtonPressed), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(rightButtonPressed), for: .touchUpInside)


    }
    
    @objc func upButtonPressed() {
        if direction != .down {
            direction = .up
        }
    }

    @objc func downButtonPressed() {
        if direction != .up {
            direction = .down
        }
    }

    @objc func leftButtonPressed() {
        if direction != .right {
            direction = .left
        }
    }

    @objc func rightButtonPressed() {
        if direction != .left {
            direction = .right
        }
    }


}

