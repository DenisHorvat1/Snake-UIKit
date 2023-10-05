//
//  Snake.swift
//  SnakeUIKit
//
//  Created by Denis Horvat  on 02.09.2023.
//

import UIKit


class Snake: ObservableObject {
    @Published var direction: Direction = .right
    @Published var snakePositions: [CGPoint]
    @Published var foodPosition: CGPoint
    @Published var timer = Timer.publish(every: 0.1, on: .current, in: .common).autoconnect()
    @Published var topScore: Int
    
    @Published var selectedSnakeSpeed: Int = 1
    @Published var selectedSnakeSize: Double = 1
    
    var snakeSize: CGFloat = 10
    var time:Double = 0.1
    var boolean = true
    
    init() {
        snakePositions = [CGPoint(x: 0 + snakeSize / 2, y: 0 + snakeSize / 2),
                         CGPoint(x: snakeSize + snakeSize / 2, y: 0 + snakeSize / 2),
                         CGPoint(x: snakeSize * 2 + snakeSize / 2, y: 0 + snakeSize / 2)].reversed()
        
        foodPosition = CGPoint(x:snakeSize * 10 + snakeSize / 2, y: snakeSize * 8 + snakeSize / 2)
        topScore = UserDefaults.standard.integer(forKey: "topScoreKey")

    }
    
    func move(in geometry: CGRect){
        settingsChanges()
        let containerSize = geometry.size
        var prev = snakePositions[0]
        

        
        for index in 1..<snakePositions.count {
            if snakePositions[0]==snakePositions[index]{
                reset()
                break
            }
        }

        
        
        if snakePositions[0].x == foodPosition.x && snakePositions[0].y == foodPosition.y {
            snakePositions.append(prev)
            setFoodPosition(in: geometry)
        }
        
        switch direction {
        case .up:
            snakePositions[0].y -= snakeSize
        case .down:
            snakePositions[0].y += snakeSize
        case .left:
            snakePositions[0].x -= snakeSize
        case .right:
            snakePositions[0].x += snakeSize
        }
        
        for index in 1..<snakePositions.count {
            let current = snakePositions[index]
            snakePositions[index] = prev
            prev = current
        }
        
        if snakePositions[0].x  <= 0 {
            snakePositions[0].x = CGFloat(Int(containerSize.width / snakeSize)) * snakeSize + snakeSize / 2
        } else if snakePositions[0].x > containerSize.width {
            snakePositions[0].x = 0 + snakeSize / 2
        } else if snakePositions[0].y <= 0 {
            snakePositions[0].y = CGFloat(Int(containerSize.height / snakeSize)) * snakeSize + snakeSize / 2
        } else if snakePositions[0].y > containerSize.height {
            snakePositions[0].y = 0 + snakeSize / 2 }
        
    }
    
    func setFoodPosition(in geometry: CGRect) {
        let randomX = Int(Int.random(in: 1..<Int(geometry.size.width)) / Int(snakeSize) ) * Int(snakeSize) + Int(snakeSize/2)
        let randomY = Int(Int.random(in: 1..<Int(geometry.size.height)) / Int(snakeSize) ) * Int(snakeSize) + Int(snakeSize/2)

        foodPosition = CGPoint(x: randomX, y: randomY)
        
        time -= 0.001
        timer = Timer.publish(every: time, on: .current, in: .common).autoconnect()
        
        if snakePositions.count-3 > topScore {
            topScore = snakePositions.count-3
            UserDefaults.standard.set(topScore, forKey: "topScoreKey")
        }
    }
    
    func reset(){
        snakePositions = [CGPoint(x: 0 + snakeSize / 2, y: 0 + snakeSize / 2),
                         CGPoint(x: snakeSize + snakeSize / 2, y: 0 + snakeSize / 2),
                         CGPoint(x: snakeSize * 2 + snakeSize / 2, y: 0 + snakeSize / 2)].reversed()
        
        foodPosition = CGPoint(x:snakeSize * 10 + snakeSize / 2, y: snakeSize * 8 + snakeSize / 2)
        direction = .right
    }
    
    func settingsChanges(){

        if boolean{
            if selectedSnakeSize == 1{
                snakeSize = 6
                reset()
            }
            else if selectedSnakeSize == 2{
                snakeSize = 10
                reset()
            }
            else if selectedSnakeSize == 3{
                snakeSize = 16
                reset()
            }
            
            if selectedSnakeSpeed == 1{
                time = 0.2
                timer = Timer.publish(every: time, on: .current, in: .common).autoconnect()
            }
            else if selectedSnakeSpeed == 2{
                time = 0.1
                timer = Timer.publish(every: time, on: .current, in: .common).autoconnect()
            }
            else if selectedSnakeSpeed == 3{
                time = 0.05
                timer = Timer.publish(every: time, on: .current, in: .common).autoconnect()
            }
            boolean = false
        }
    }
}
