//
//  ViewController.swift
//  Counter
//
//  Created by Mahsa on 7/29/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let counterLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 90)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let decrementButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let incrementButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        let padding = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.contentEdgeInsets = padding
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.lineBreakMode = .byClipping
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let lockButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("UnLocked", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        let padding = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.contentEdgeInsets = padding
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.lineBreakMode = .byClipping
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let speedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("1x Speed", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        let padding = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.contentEdgeInsets = padding
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.lineBreakMode = .byClipping
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let bottomContainerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var logic = Logic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateCounterLabel()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBlue
        
        
        let stackView = UIStackView(arrangedSubviews: [decrementButton, incrementButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(counterLabel)
        view.addSubview(stackView)
        view.addSubview(bottomContainerView)
        
        bottomContainerView.addArrangedSubview(resetButton)
        bottomContainerView.addArrangedSubview(lockButton)
        bottomContainerView.addArrangedSubview(speedButton)
        
        NSLayoutConstraint.activate([
            counterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            counterLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            decrementButton.widthAnchor.constraint(equalToConstant: 60),
            incrementButton.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            bottomContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bottomContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bottomContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            bottomContainerView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        decrementButton.addTarget(self, action: #selector(decrementTapped), for: .touchUpInside)
        incrementButton.addTarget(self, action: #selector(incrementTapped), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
        lockButton.addTarget(self, action: #selector(lockTapped), for: .touchUpInside)
        speedButton.addTarget(self, action: #selector(speedTapped), for: .touchUpInside)
    }
    
    @objc private func decrementTapped() {
        logic.Decreasee()
        updateCounterLabel()
    }
    
    @objc private func incrementTapped() {
        logic.Increase()
        updateCounterLabel()
    }
    
    @objc private func resetTapped() {
        logic.Reset()
        updateCounterLabel()
    }
    
    @objc private func lockTapped() {
        if logic.IsLocked {
            logic.UnLock()
            lockButton.setTitle("UnLocked", for: .normal)
        } else {
            logic.Lock()
            lockButton.setTitle("Locked", for: .normal)
        }
    }
    
    @objc private func speedTapped() {
        logic.ChangeSpeed()
        speedButton.setTitle("\(logic.Step)x Speed", for: .normal)
    }
    
    private func updateCounterLabel() {
        counterLabel.text = "\(logic.Countnumber)"
    }
}


