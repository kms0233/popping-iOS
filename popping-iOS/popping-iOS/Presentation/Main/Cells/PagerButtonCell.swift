//
//  PagerButtonCell.swift
//  popping-iOS
//
//  Created by 김민서 on 6/26/24.
//

import UIKit

import SnapKit
import Then

class PagerButtonCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    
    let pagerButton = UIButton()
        
    
    // MARK: - Properties
    
    static let identifier: String = "PagerButtonCell"
    
    
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

private extension PagerButtonCell {
    
    func setHierarchy() {
        
        self.addSubview(pagerButton)
        
    }
    
    func setLayout() {
        
        pagerButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    func setStyle() {
        
        pagerButton.do {
            $0.layer.cornerRadius = 2
            $0.backgroundColor = .gray1
            $0.isUserInteractionEnabled = true
        }
        
    }
    
}
