//
//  Article.swift
//  popping-iOS
//
//  Created by 김민서 on 6/28/24.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String?
    let description: String?
}

//우리가 받을 json파일 안에 articles라는 배열이 있음
//이걸 ArticleList로 받아줄거임


