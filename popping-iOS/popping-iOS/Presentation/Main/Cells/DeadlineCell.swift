//
//  DeadlineCell.swift
//  popping-iOS
//
//  Created by 김민서 on 8/1/24.
//

import UIKit

import SnapKit
import Then

class DeadlineCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    
    let posterImageView = UIImageView()
    
    let dDayLabel = UIButton()
    
    let titleLabel = UILabel()
    
    let locationLabel = UILabel()
    
    let dateLabel = UILabel()
    
    // MARK: - Properties
    
    static let identifier: String = "DeadlineCell"
    
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
        self.contentView.addSubviews(posterImageView, dDayLabel, titleLabel, locationLabel, dateLabel)
    }
    
    private func setLayout() {
        posterImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.height.equalTo(139)
        }
        
        dDayLabel.snp.makeConstraints {
            $0.top.equalTo(posterImageView).inset(-5)
            $0.trailing.equalTo(posterImageView).inset(17)
            $0.width.equalTo(33)
            $0.height.equalTo(29)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.bottom).offset(4)
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
        
        dDayLabel.do {
            $0.backgroundColor = UIColor(resource: .gray0)
            $0.setTitle("D - 1", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Semibold", size: 11)
            $0.roundCorners(cornerRadius: 17, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
            $0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
        }
    }
}
