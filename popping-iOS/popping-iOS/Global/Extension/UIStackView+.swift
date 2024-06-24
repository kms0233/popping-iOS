//
//  UIStackView+.swift
//  popping-iOS
//
//  Created by 김민서 on 6/24/24.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
    
}

