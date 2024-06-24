//
//  ViewController.swift
//  popping-iOS
//
//  Created by 김민서 on 6/24/24.
//

import UIKit

import SnapKit
import Then


final class LoginViewController: UIViewController {
    
    // MARK: - UI Properties
    private let loginView = LoginView()
    
    var nickname: String = ""
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
        setDelegate()
    }
}


// MARK: - Private Methods

private extension LoginViewController {
    
    func setHierarchy() {
        self.view.addSubviews(loginView)
    }
    
    func setLayout() {
        loginView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
    }
    
    func setStyle() {
        self.view.backgroundColor = UIColor(resource: .black)
        

    }
    
    func setDelegate() {
       
    }
  
    
}

extension LoginViewController: nickNameInputViewControllerDelegate {
    
    func saveUserNickname(nickname: String) {
        self.nickname = nickname
    }
}

