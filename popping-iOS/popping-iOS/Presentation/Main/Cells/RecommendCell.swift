//
//  RecommendCell.swift
//  popping-iOS
//
//  Created by 김민서 on 6/26/24.
//

import UIKit

import SnapKit
import Then

class RecommendCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    
    let posterImageView = UIImageView()
    
    private let categoryTag = UIButton()
    
    let titleLabel = UILabel()
    
    let locationLabel = UILabel()
    
    let dateLabel = UILabel()
    
    // MARK: - Properties
    
    static let identifier: String = "RecommendCell"
    
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
    
    func setCell(contents: Contents) {
        posterImageView.image = contents.image
        titleLabel.text = contents.title
        locationLabel.text = contents.location
        dateLabel.text = contents.date
    }
    
    // MARK: - Private Methods
    
    private func setHierarchy() {
        self.contentView.addSubviews(posterImageView, categoryTag, titleLabel, locationLabel, dateLabel)
    }
    
    private func setLayout() {
        posterImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.height.equalTo(139)
        }
        
        categoryTag.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
            $0.height.equalTo(21)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(categoryTag.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    private func setStyle() {
        posterImageView.do {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 7
            $0.contentMode = .scaleAspectFill
        }
        
        titleLabel.do {
            $0.textColor = .black
            $0.font = UIFont(name: "Pretendard-Medium", size: 13)
            $0.numberOfLines = 1
            $0.textAlignment = .left
        }
        
        locationLabel.do {
            $0.textColor = .black
            $0.font = UIFont(name: "Pretendard-Regular", size: 11)
            $0.textAlignment = .left
        }
        
        dateLabel.do {
            $0.textColor = UIColor(resource: .gray1)
            $0.font = UIFont(name: "Pretendard-Regular", size: 11)
            $0.textAlignment = .left
        }
        
        categoryTag.do {
            $0.backgroundColor = UIColor(resource: .lightpink)
            $0.setTitle("#패션/의류", for: .normal)
            $0.setTitleColor(.main, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Semibold", size: 9)
            $0.layer.cornerRadius = 5
            $0.layer.borderWidth = 0.7
            $0.layer.borderColor = UIColor(resource: .main).cgColor
            $0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 7)
        }
    }
}
