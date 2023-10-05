//
//  SnakeViewController.swift
//  SnakeUIKit
//
//  Created by Denis Horvat  on 01.09.2023.
//

import UIKit

class SnakeViewController: UIViewController {
    
    var gameView = GameView()
    var scoreView = ScoreView()
    var buttonsView = ButtonsView()
    
    var snake: Snake
    var selectedSnakeSpeed: Int
    var selectedSnakeSize: Double
    
    var main: MainController
        
    init(snake: Snake = Snake(), main: MainController) {
        self.main = main
        self.snake = snake
        self.selectedSnakeSpeed = main.settingViewController.selectedSnakeSpeed
        self.selectedSnakeSize = main.settingViewController.selectedSnakeSize
        super.init(nibName: nil, bundle: nil)
        
        self.snake.selectedSnakeSize = selectedSnakeSize
        self.snake.selectedSnakeSpeed = selectedSnakeSpeed
        
        _ = Timer.scheduledTimer(withTimeInterval: snake.time, repeats: true) { timer in
            
            self.gameView.subviews.filter { $0.backgroundColor == .green }.forEach { $0.removeFromSuperview() } //remove old snake bodies
            self.gameView.subviews.filter { $0.backgroundColor == .red }.forEach { $0.removeFromSuperview() } //remove old food
            
            self.scoreView.setScore(score: snake.snakePositions.count-3, topScore: snake.topScore)
            
            snake.direction = self.buttonsView.direction
            
            snake.move(in: self.gameView.frame)
            
            for index in 0..<snake.snakePositions.count {
                let bodyView = UIView()
                bodyView.frame = CGRect(x: snake.snakePositions[index].x, y: snake.snakePositions[index].y, width: snake.snakeSize, height: snake.snakeSize)
                bodyView.backgroundColor = .green
                self.gameView.addSubview(bodyView)
            }
            
            let foodView = UIView()
            foodView.backgroundColor = .red
            foodView.frame = CGRect(x: snake.foodPosition.x, y: snake.foodPosition.y, width: snake.snakeSize, height: snake.snakeSize)
            self.gameView.addSubview(foodView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension SnakeViewController {
    
    func setupUI() {
        view.addSubview(gameView)
        view.addSubview(scoreView)
        view.addSubview(buttonsView)
        
        gameView.translatesAutoresizingMaskIntoConstraints = false
        scoreView.translatesAutoresizingMaskIntoConstraints = false
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scoreView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scoreView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scoreView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            gameView.topAnchor.constraint(equalTo: scoreView.bottomAnchor),
            gameView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            gameView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            buttonsView.topAnchor.constraint(equalTo: gameView.bottomAnchor),
            buttonsView.heightAnchor.constraint(equalToConstant: buttonsView.buttonsSize * 2 + buttonsView.spaceSize * 3),
            buttonsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttonsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
        
    }
}
