//
//  HeaderView.swift
//  popping-iOS
//
//  Created by 김민서 on 6/26/24.
//

import UIKit

import SnapKit
import Then

class HeaderView: UICollectionReusableView {
    
    // MARK: - UI Properties
    
    let titleLabel: UILabel = UILabel()
    let viewAllButton: UIButton = UIButton()
    
    
    // MARK: - Properties
    
    static let elementKinds: String = "header"

    static let identifier: String = "BasicHeaderView"

    
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
    
    func bindTitle(headerTitle: String) {
        self.titleLabel.text = headerTitle
    }
    
}


// MARK: - Private Methods

private extension HeaderView {
    
    func setHierarchy() {
        self.addSubviews(titleLabel, viewAllButton)
        
    }
    
    func setLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        viewAllButton.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(15)
        }
        
    }
    
    func setStyle() {
        
        titleLabel.do {
            $0.text = "나를 위한 팝업 정보"
            $0.textColor = .black
            $0.textAlignment = .center
            $0.numberOfLines = 1
            $0.font = UIFont(name: "Pretendard-Semibold", size: 17)
        }
        
        viewAllButton.do {
            $0.setTitle("더보기", for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 11)
            $0.setTitleColor(UIColor(resource: .gray1), for: .normal)
            $0.semanticContentAttribute = .forceRightToLeft
        }
        
    }
    
}
