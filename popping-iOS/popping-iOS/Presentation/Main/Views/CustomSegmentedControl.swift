//
//  CustomSegmentedControl.swift
//  popping-iOS
//
//  Created by 김민서 on 8/1/24.
//

import UIKit

class CustomSegmentedControl: UISegmentedControl {
    
    private lazy var underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        self.addSubview(view)
        return view
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    override init(items: [Any]?) {
        super.init(items: items)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    
    private func configure() {
        removeBackgroundAndDivider()
        setUnderlineView()
        setTextAttributes()

    }
    
    private func removeBackgroundAndDivider() {
        let image = UIImage()
        self.setBackgroundImage(image, for: .normal, barMetrics: .default)
        self.setBackgroundImage(image, for: .selected, barMetrics: .default)
        self.setBackgroundImage(image, for: .highlighted, barMetrics: .default)
        self.setDividerImage(image, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
    }
    
    private func setUnderlineView() {
        let segmentWidth = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let height: CGFloat = 1.5
        let width: CGFloat = segmentWidth * 0.3
        let xPosition: CGFloat = CGFloat(self.selectedSegmentIndex) * segmentWidth + (segmentWidth - width) / 2
        let yPosition: CGFloat = self.bounds.size.height - height - 4
        underlineView.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
    }
    
    private func setTextAttributes() {
        let font = UIFont(name: "Pretendard-Medium", size: 15) ?? UIFont.systemFont(ofSize: 15)
        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor(resource: .gray1)
        ]
        self.setTitleTextAttributes(textAttributes, for: .normal)
        
        let selectedTextAttributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor(resource: .black) // 선택된 탭의 텍스트 색상
        ]
        self.setTitleTextAttributes(selectedTextAttributes, for: .selected)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let segmentWidth = self.bounds.width / CGFloat(self.numberOfSegments)
        let underlineWidth = segmentWidth * 0.25
        let underlineXPosition = CGFloat(self.selectedSegmentIndex) * segmentWidth + (segmentWidth - underlineWidth) / 2
        let underlineYPosition = self.bounds.size.height - underlineView.bounds.size.height - 13
        
        UIView.animate(withDuration: 0.1) {
            self.underlineView.frame = CGRect(
                x: underlineXPosition,
                y: underlineYPosition,
                width: underlineWidth,
                height: self.underlineView.bounds.size.height
            )
        }
    }
}
