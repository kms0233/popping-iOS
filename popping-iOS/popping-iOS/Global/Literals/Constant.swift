//
//  Constant.swift
//  popping-iOS
//
//  Created by 김민서 on 6/26/24.
//

import UIKit

enum Constant {
    struct Screen {
        public static let width = UIScreen.main.bounds.width
        public static let height = UIScreen.main.bounds.height
        public static let topSafeAreaHeight = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0.0
    }
}

enum MainSection {
    case mainContents
    case recommendedContents
    case deadlineContents
    
    static let dataSource: [MainSection] = [
        MainSection.mainContents,
        MainSection.recommendedContents,
        MainSection.deadlineContents
    ]
}

