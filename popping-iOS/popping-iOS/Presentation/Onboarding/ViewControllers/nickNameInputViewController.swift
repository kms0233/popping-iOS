//
//  nickNameInputView.swift
//  popping-iOS
//
//  Created by 김민서 on 6/24/24.
//

import UIKit

import SnapKit
import Then

final class nickNameInputViewController: UIViewController {
    
    // MARK: - UI Properties


    
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

private extension nickNameInputViewController {
    
    func setHierarchy() {
        self.addSubviews()
    }
    
    func setLayout() {
       
    }
    
    func setStyle() {
        self.backgroundColor = UIColor()
        
  
    }
}

