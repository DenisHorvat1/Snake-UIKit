//
//  ViewController.swift
//  SnakeUIKit
//
//  Created by Denis Horvat  on 01.09.2023.
//

import UIKit

class MainController: UIViewController {
    
    var startButton = UIButton()
    var settingsButton = UIButton()
    var snakeLabel = UILabel()
    
    lazy var settingViewController: SettingsViewController = {
          return SettingsViewController(main: self)
    }()
      
    lazy var snakeViewController: SnakeViewController = {
        return SnakeViewController(main: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
    }
}


extension MainController {
    @objc func startButtonTapped() {
        
        snakeViewController.modalPresentationStyle = .fullScreen
        self.present(snakeViewController, animated: true, completion: nil)
    }
    
    @objc func settingsButtonTapped() {
        //SettingsViewController.modalPresentationStyle = .fullScreen
        self.present(settingViewController, animated: true, completion: nil)
    }
    
    
    func setupUI() {
        
        view.addSubview(startButton)
        view.addSubview(snakeLabel)
        view.addSubview(settingsButton)
        
        startButton.setTitle("Start", for: .normal)
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)

        settingsButton.setTitle("Settings", for: .normal)
        settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        
        snakeLabel.text = "SNAKE"
        snakeLabel.textAlignment = .center
        snakeLabel.textColor = .green
        
        snakeLabel.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            snakeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            snakeLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            snakeLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            startButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            startButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            startButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            settingsButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 20),
            settingsButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            settingsButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
        
        settingsButton.isHidden = true
    }
}

