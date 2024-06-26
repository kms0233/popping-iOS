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
        
        self.addSubviews(searchTextField, alarmIcon)
        
    }
    
    func setLayout() {
        
        searchTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(19)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(304)
            $0.height.equalTo(40)
        }
        
        alarmIcon.snp.makeConstraints {
            $0.centerY.equalTo(searchTextField)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(24)
            $0.height.equalTo(29)

        }
        
    }
    
    func setStyle() {
        self.backgroundColor = UIColor(resource: .black)
        
        searchTextField.do {
            $0.font = UIFont(name: "Pretendard-Medium", size: 13)
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 20
            $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: $0.frame.height))
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
