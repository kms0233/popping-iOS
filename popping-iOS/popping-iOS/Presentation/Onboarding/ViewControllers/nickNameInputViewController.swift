//
//  nickNameInputView.swift
//  popping-iOS
//
//  Created by 김민서 on 6/24/24.
//

import UIKit

import SnapKit
import Then

protocol nickNameInputViewControllerDelegate: AnyObject {
    func saveUserNickname(nickname: String)
}

final class nickNameInputViewController: UIViewController {
    
    // MARK: - UI Properties
    private let dimmedView = UIView()
    private let bottomSheetView = UIView()
    private let nicknameLabel = UILabel()
    private let nicknameTextField = UITextField()
    private let startButton = UIButton()
    private let logoImgaeView = UIImageView(image: .logoBlur)
    
    
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    
}


// MARK: - Private Methods

private extension nickNameInputViewController {
    
    func setHierarchy() {
        self.view.addSubviews(dimmedView, bottomSheetView, nicknameLabel, nicknameTextField, startButton, logoImgaeView)
    }
    
    func setLayout() {
        dimmedView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(bottomSheetView)
        }
        
        bottomSheetView.snp.makeConstraints {
            $0.height.equalTo(406)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.leading.equalToSuperview().inset(20)
        }
        
        startButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(30)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(56)
        }
        
    }
    
    func setStyle() {
        dimmedView.do {
            $0.alpha = 0.7
            $0.layer.backgroundColor = UIColor(resource: .black).cgColor
            //let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapDimmedView))
            $0.isUserInteractionEnabled = true
            //$0.addGestureRecognizer(gesture)
        }
        
        bottomSheetView.do {
            $0.backgroundColor = .white
            $0.roundCorners(cornerRadius: 20, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        }
        
        nicknameLabel.do{
            $0.text = "사용하실 닉네임을 입력해주세요!"
            $0.textColor = .black
            $0.textAlignment = .center
            $0.numberOfLines = 1
            $0.font = UIFont(name: "Pretendard-Semibold", size: 20)
        }
        
        startButton.do {
            $0.backgroundColor = UIColor(resource: .main)
            $0.setTitle("시작하기!", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Semibold", size: 14)
            $0.layer.cornerRadius = 7
            
        }
        
        
        
        
    }
    
    @objc
    func pushToOnboardingVC() {
        let nickname = self.nicknameTextField.text ?? ""
       // self.delegate?.saveUserNickname(nickname: nickname)
        self.dismiss(animated: true)
    }
    
    @objc
    func didTapDimmedView(sender: UITapGestureRecognizer) {
        self.dismiss(animated: true)
    }
    
}

