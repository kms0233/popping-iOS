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
    }
    
}


// MARK: - Private Methods

private extension LoginViewController {
    
    func setHierarchy() {
        self.view.addSubviews(loginView)
    }
    
    func setLayout() {
        loginView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func setStyle() {
        self.view.backgroundColor = UIColor(resource: .black)
        
    }
    
}


extension LoginViewController: LoginViewDelegate {
    
    func pushToNicknameInputVC(){
        let nicknameInputVC = NicknameInputViewController()
        self.navigationController?.pushViewController(nicknameInputVC, animated: true)
    }
}
