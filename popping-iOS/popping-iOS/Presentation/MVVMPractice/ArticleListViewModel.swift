//
//  ArticleListViewModel.swift
//  popping-iOS
//
//  Created by 김민서 on 6/28/24.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
}

//tableView가 필요로 하는 numberOfRowsInSection/cellForRowAt에 넣어줄 함수 /numberOfSection
extension ArticleListViewModel {
    var numberOfSections: Int {
        return 1
    }

    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }

    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}

//단일 Article 객체를 감싸는 역할
struct ArticleViewModel {
    private let article: Article
}


//ArticleViewModel의 초기화 메서드를 정의
extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

//ArticleViewModel 속성에 접근할 수 있는 계산속성 정의
extension ArticleViewModel {
    var title: String? {
        return self.article.title
    }
    var description: String? {
        return self.article.description
    }
}
