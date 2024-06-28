//
//  Article.swift
//  popping-iOS
//
//  Created by 김민서 on 6/28/24.
//

import Foundation

//Model
//JSON 데이터를 파싱해 사용할 데이터 구조를 정의
//우리가 받을 json파일 안에 articles라는 배열이 있음
//이걸 ArticleList로 받아줄거임

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String?
    let description: String?
}




