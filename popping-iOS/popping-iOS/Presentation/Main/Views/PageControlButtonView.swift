//
//  PageControlButtonView.swift
//  popping-iOS
//
//  Created by 김민서 on 6/26/24.
//

import UIKit

protocol PageControlButtonDelegate: AnyObject {
    func didTapControlButton(index: Int)
}

class PageControlButtonView: UICollectionReusableView {
    
    // MARK: - UI Properties
    
    private let pageLabel = UILabel()
    private let roundBox = UIView()
    
    // MARK: - Properties
    
    static let elementKinds: String = "footer"
    weak var delegate: PageControlButtonDelegate?
    static let identifier: String = "PageControlButtonView"
    
    var index: Int = 0 {
        didSet {
            updatePageLabel()
        }
    }
    
    var buttonCount: Int = 0 {
        didSet {
            updatePageLabel()
        }
    }
    
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
    
    private func updatePageLabel() {
        pageLabel.text = "\(index + 1)/\(buttonCount)"
    }
}

// MARK: - Private Methods

private extension PageControlButtonView {
    
    func setHierarchy() {
        self.addSubviews(roundBox, pageLabel)
    }
    
    func setLayout() {
        pageLabel.snp.makeConstraints {
            $0.centerX.centerY.equalTo(roundBox)
        }
        roundBox.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(35)
            $0.height.equalToSuperview()
        }
    }
    
    func setStyle() {
        pageLabel.do {
            $0.textColor = .white
            $0.font = UIFont(name: "Pretendard-Regular", size: 9)
            $0.textAlignment = .right
        }
        
        roundBox.do {
            $0.backgroundColor = .gray1
            $0.layer.cornerRadius = 8
        }
    }
}

