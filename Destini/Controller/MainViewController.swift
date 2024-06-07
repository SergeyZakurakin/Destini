//
//  MainViewController.swift
//  Destini
//
//  Created by Sergey Zakurakin on 06/06/2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    
    var storyBrain = StoryBrain()
    
    // MARK: - Setup UI
    private lazy var buttonStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 10
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.text = "Story Text"
        element.textColor = .white
        element.numberOfLines = 0
        element.font = .systemFont(ofSize: 24)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var backGround: UIImageView = {
        var element = UIImageView()
        element.alpha = 0.9
        element.image = UIImage(named: "background")
        element.contentMode = .scaleToFill
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var choiceOneButton: UIButton = {
        var element = UIButton(type: .system)
        element.configuration = .bordered()
        element.tintColor = .white
        element.setTitle("Take a left.", for: .normal)
        element.backgroundColor = .purple
        element.layer.cornerRadius = 15
        element.addTarget(self, action: #selector(choiceMade), for: .touchUpInside)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var choiceTwoButton: UIButton = {
        var element = UIButton(type: .system)
        element.tintColor = .white
        element.setTitle("Take a right.", for: .normal)
        element.backgroundColor = .purple
        element.layer.cornerRadius = 15
        element.addTarget(self, action: #selector(choiceMade), for: .touchUpInside)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    @objc private func choiceMade(_ sender: UIButton) {
        
        let userChoice = sender.currentTitle!
        
        storyBrain.nextStory(userChoice: userChoice)
        updateUI()
        
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraint()
        updateUI()
    }
    
    
    private func updateUI() {
        titleLabel.text = storyBrain.getStory()
        choiceOneButton.setTitle(storyBrain.getChoiceOne(), for: .normal)
        choiceTwoButton.setTitle(storyBrain.getChoiceTwo(), for: .normal)
    }
}

// MARK: - Setup View and Setup Constraint
extension MainViewController {
    
    func setupView() {
        view.backgroundColor = .black
        
        view.addSubview(backGround)
        view.addSubview(titleLabel)
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(choiceOneButton)
        buttonStackView.addArrangedSubview(choiceTwoButton)
        
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            backGround.topAnchor.constraint(equalTo: view.topAnchor),
            backGround.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backGround.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backGround.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            choiceOneButton.heightAnchor.constraint(equalToConstant: 80),
            choiceTwoButton.heightAnchor.constraint(equalToConstant: 80),
            
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}

