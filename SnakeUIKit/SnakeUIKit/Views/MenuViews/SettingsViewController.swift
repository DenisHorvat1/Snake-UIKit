//
//  SettingsViewController.swift
//  SnakeUIKit
//
//  Created by Denis Horvat  on 02.09.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var selectedSnakeSpeed: Int = 2
    var selectedSnakeSize: Double = 2.0

    var mainController: MainController
    
    init(main: MainController) {
        self.mainController = main
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .gray
    }
}


