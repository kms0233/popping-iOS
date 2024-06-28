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

struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String? {
        return self.article.title
    }
    var description: String? {
        return self.article.description
    }
}
