//
//  Contents.swift
//  popping-iOS
//
//  Created by 김민서 on 6/26/24.
//

import UIKit

struct Contents {
    let image: UIImage
    let title: String
    let location: String
    let date: String
}

extension Contents {
    static let posterImages: [UIImage] = [
        UIImage(resource: .image1),
        UIImage(resource: .image2),
        UIImage(resource: .image1),
        UIImage(resource: .image2),
        UIImage(resource: .image1),
        UIImage(resource: .image1),
        UIImage(resource: .image1)
    ]
    
    static let categoryImages: [UIImage] = [
        UIImage(resource: .recommend1),
        UIImage(resource: .recommend2),
        UIImage(resource: .recommend3),
        UIImage(resource: .recommend1),
        UIImage(resource: .recommend2),
        UIImage(resource: .recommend3),
        UIImage(resource: .image1)
    ]
    
    static let categoryImages2: [UIImage] = [
        UIImage(resource: .recommend4),
        UIImage(resource: .recommend5),
        UIImage(resource: .recommend6),
        UIImage(resource: .recommend1),
        UIImage(resource: .recommend2),
        UIImage(resource: .recommend3),
        UIImage(resource: .recommend2)
    ]
    
    static let dummyTexts: [String] = [
        "Threetimes 23 FW",
        "SUPER MATCHA",
        "시몬스 그로서리 스토어",
        "Threetimes 23 FW.",
        "SUPER MATCHA",
        "시몬스 그로서리 스토어",
        "Threetimes 23 FW"
    ]
    static let locationDummy: [String] = [
        "서울시 마포구",
        "서울시 영등포구",
        "부산시 해운대구",
        "서울시 마포구",
        "서울시 영등포구",
        "부산시 해운대구",
        "서울시 마포구"
    ]
    
    static let dateDummy: [String] = [
        "3.1 ~ 3.31",
        "9/13 - 9/17",
        "7/15 - 9/28",
        "상시 영업",
        "3.1 ~ 3.31",
        "9/13 - 9/17",
        "7/15 - 9/28",
        "상시 영업"
    ]
    
    static func recommendDummyContents() -> [Contents] {
        var dummyContents: [Contents] = []
        for i in 0..<categoryImages.count {
            let title = dummyTexts[i % dummyTexts.count]
            let location = locationDummy[i % locationDummy.count]
            let date = dateDummy[i % dateDummy.count]
            dummyContents.append(Contents(image: categoryImages[i], title: title, location: location, date: date))
        }
        return dummyContents
    }
    
    static func deadlineDummyContents() -> [Contents] {
        var dummyContents: [Contents] = []
        for i in 0..<categoryImages2.count {
            let title = dummyTexts[i % dummyTexts.count]
            let location = locationDummy[i % locationDummy.count]
            let date = dateDummy[i % dateDummy.count]
            dummyContents.append(Contents(image: categoryImages2[i], title: title, location: location, date: date))
        }
        return dummyContents
    }
}
