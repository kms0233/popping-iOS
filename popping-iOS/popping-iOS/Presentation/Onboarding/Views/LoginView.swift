//
//  LoginView.swift
//  popping-iOS
//
//  Created by 김민서 on 6/24/24.
//

import UIKit

import SnapKit
import Then

protocol LoginViewDelegate: AnyObject {
    func presentCreateNicknameVC()
}

final class LoginView: UIView {
    
    // MARK: - UI Properties
    private let titleLabel = UILabel()
    private let logoImageView = UIImageView(image: .logo)
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private lazy var loginButton = UIButton()
    private let joinLabel = UILabel()
    
    // MARK: - Properties
    weak var delegate: LoginViewDelegate?
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods

private extension LoginView {
    
    func setHierarchy() {
        self.addSubviews(titleLabel, logoImageView, idTextField, passwordTextField, loginButton, joinLabel)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(185)
            $0.centerX.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(163)
            $0.height.equalTo(36)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(113)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(56)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(9)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(56)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(56)
        }
        
        joinLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(28)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setStyle() {
        
        titleLabel.do{
            $0.text = "나를 위한 팝업 정보"
            $0.textColor = .white
            $0.textAlignment = .center
            $0.numberOfLines = 1
            $0.font = UIFont(name: "Pretendard-Medium", size: 13)
        }
        
        idTextField.do {
            $0.font = UIFont(name: "Pretendard-Semibold", size: 13)
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 7
            $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: $0.frame.height))
            $0.leftViewMode = .always
            $0.textColor = UIColor(resource: .black)
            
            // placeholder의 색상을 변경
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.gray1, // 변경하고자 하는 색상
                .font: UIFont(name: "Pretendard-Semibold", size: 13) ?? UIFont.systemFont(ofSize: 13) // 폰트 설정 (nil 방지를 위한 기본 폰트)
            ]
            $0.attributedPlaceholder = NSAttributedString(string: "아이디", attributes: attributes)
        }
        passwordTextField.do {
            $0.font = UIFont(name: "Pretendard-Semibold", size: 13)
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 7
            $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: $0.frame.height))
            $0.leftViewMode = .always
            $0.textColor = UIColor(resource: .black)
            
            // placeholder의 색상을 변경
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.gray1, // 변경하고자 하는 색상
                .font: UIFont(name: "Pretendard-Semibold", size: 13) ?? UIFont.systemFont(ofSize: 13) // 폰트 설정 (nil 방지를 위한 기본 폰트)
            ]
            $0.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: attributes)
        }
        
        loginButton.do {
            $0.backgroundColor = UIColor(resource: .main)
            $0.setTitle("로그인하기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Semibold", size: 14)
            $0.layer.cornerRadius = 7
            
            let gesture = UITapGestureRecognizer(target: self, action: #selector(loginButtonTapped))
            $0.isUserInteractionEnabled = true
            $0.addGestureRecognizer(gesture)
        }
        
        joinLabel.do {
            $0.text = "아직 계정이 없으신가요? 회원가입하기"
            $0.textColor = .white
            $0.textAlignment = .center
            $0.numberOfLines = 1
            $0.font = UIFont(name: "Pretendard-Medium", size: 13)
        }
    }
    
    @objc
    func loginButtonTapped(sender: UITapGestureRecognizer) {
        delegate?.presentCreateNicknameVC()
    }
}
