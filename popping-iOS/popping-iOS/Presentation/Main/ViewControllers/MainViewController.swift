//
//  MainViewController.swift
//  popping-iOS
//
//  Created by 김민서 on 6/26/24.
//


import UIKit

import SnapKit
import Then


final class MainViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let mainView = MainView()
    
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
        setDelegate()
    }
}


// MARK: - Private Methods

private extension MainViewController {
    
    func setHierarchy() {
        self.view.addSubviews(mainView)
    }
    
    func setLayout() {
        mainView.snp.makeConstraints {
            $0.top.bottom.trailing.leading.equalToSuperview()
        }
        
    }
    
    func setStyle() {
        
    }
    
    func setDelegate() {
    
    }
  
    
}

