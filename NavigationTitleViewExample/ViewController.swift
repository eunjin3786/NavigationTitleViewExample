//
//  ViewController.swift
//  NavigationTitleViewExample
//
//  Created by Jinny on 2020/05/04.
//  Copyright © 2020 eunjin. All rights reserved.
//

import UIKit

class NavigationTitleButtonView: UIView {
    let titleButton = UIButton()
    private var allConstraintsDidSetup = false
    
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        setup(with: title)
    }
    
    private func setup(with title: String) {
        titleButton.setTitle(title, for: .normal)
        titleButton.setTitleColor(.black, for: .normal)
        titleButton.titleLabel?.lineBreakMode = .byTruncatingTail
        titleButton.backgroundColor = .lightGray
        titleButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleButton)
        titleButton.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)

        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: titleButton.topAnchor),
            self.bottomAnchor.constraint(equalTo: titleButton.bottomAnchor),
            self.leftAnchor.constraint(equalTo: titleButton.leftAnchor),
            self.rightAnchor.constraint(equalTo: titleButton.rightAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard allConstraintsDidSetup else {
            NSLayoutConstraint.activate([
                titleButton.widthAnchor.constraint(equalTo: self.window!.widthAnchor, constant: -100 * 2)
            ])
            allConstraintsDidSetup = true
            return
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
    @objc
    func buttonDidTap() {
        print("버튼이 눌렸다")
    }
}

class NavigationTitleView: UIView {
    let titleLabel = UILabel()
    private var constraintsDidSetup = false
    
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        setup(with: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(with title: String) {
        titleLabel.text = title
        titleLabel.backgroundColor = .lightGray
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard constraintsDidSetup else {
            NSLayoutConstraint.activate([
                titleLabel.leftAnchor.constraint(equalTo: self.window!.leftAnchor, constant: 100),
                titleLabel.rightAnchor.constraint(equalTo: self.window!.rightAnchor, constant: -100),
                titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
            constraintsDidSetup = true
            return
        }
    }
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = NavigationTitleButtonView(frame: .zero, title: "안녕하세요 반갑습니다 룰루랄라 룰루랄라랄라라라랄라안녕하세요 반갑습니다 룰루랄라 룰루랄라랄라라라랄라안녕하세요 반갑습니다 룰루랄라 룰루랄라랄라라라랄라안녕하세요 반갑습니다 룰루랄라 룰루랄라랄라라라랄라")
    }
}
