//
//  NavigationBarView.swift
//  popping-iOS
//
//  Created by 김민서 on 6/26/24.
//

import UIKit

import SnapKit
import Then

class NavigationBarView: UIView {
    
    // MARK: - UI Properties
    
    private let searchTextField = UITextField()
    
    private let searchIcon = UIImageView(image: .searchIcon)
    
    private let alarmIcon = UIImageView(image: .alarmIcon)
    
    // MARK: - Properties
    
    
    
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

private extension NavigationBarView {
    
    func setHierarchy() {
        
        self.addSubviews(searchTextField, searchIcon, alarmIcon)
        
    }
    
    func setLayout() {
        
        searchTextField.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalTo(alarmIcon.snp.leading).offset(-18)
            $0.height.equalTo(36)
        }
        
        searchIcon.snp.makeConstraints {
            $0.centerY.equalTo(searchTextField)
            $0.leading.equalTo(searchTextField).inset(12)
            $0.size.equalTo(16)
        }
        alarmIcon.snp.makeConstraints {
            $0.centerY.equalTo(searchTextField)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(19)
            $0.height.equalTo(22)

        }
        
    }
    
    func setStyle() {
        self.backgroundColor = UIColor(resource: .black)
        
        searchTextField.do {
            $0.font = UIFont(name: "Pretendard-Medium", size: 13)
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 18
            $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: $0.frame.height))
            $0.leftViewMode = .always
            $0.textColor = UIColor(resource: .black)
            
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.gray1,
                .font: UIFont(name: "Pretendard-Medium", size: 13) ?? UIFont.systemFont(ofSize: 13)
            ]
            $0.attributedPlaceholder = NSAttributedString(string: "관심있는 팝업을 검색해 보세요!", attributes: attributes)
        }
        
    }
    
}
