//
//  MainViewController.swift
//  popping-iOS
//
//  Created by 김민서 on 6/26/24.
//


import UIKit

import SnapKit
import Then

final class MainViewController: UIViewController, UICollectionViewDelegate {
    
    // MARK: - UI Properties
    
    private let mainView = MainView()
    
    
    private var mainData: [Contents] = Contents.posterImages.map { Contents(image: $0, title: "", location: "", date: "") }
    private var recommendData: [Contents] = Contents.recommendDummyContents()
    private var deadlineData: [Contents] = Contents.deadlineDummyContents()
    private let dataSource: [MainSection] = MainSection.dataSource

    private var currentPage: Int = 0
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHierarchy()
        setLayout()
        setStyle()
        setDelegate()
        registerCell()
    }
    
    // MARK: - Private Methods
    
    private func setHierarchy() {
        self.view.addSubview(mainView)
    }
    
    private func setLayout() {
        
        mainView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setStyle() {
        self.navigationController?.navigationBar.isHidden = true
 
    }
    
    private func setDelegate() {
        mainView.mainCollectionView.delegate = self
        mainView.mainCollectionView.dataSource = self
    }
    
    private func registerCell() {
        mainView.mainCollectionView.do {
            $0.register(MainPosterCell.self, forCellWithReuseIdentifier: MainPosterCell.identifier)
            $0.register(RecommendCell.self, forCellWithReuseIdentifier: RecommendCell.identifier)
            $0.register(HeaderView.self, forSupplementaryViewOfKind: HeaderView.elementKinds, withReuseIdentifier: HeaderView.identifier)
            $0.register(PageControlButtonView.self, forSupplementaryViewOfKind: PageControlButtonView.elementKinds, withReuseIdentifier: PageControlButtonView.identifier)
        }
    }
    
    
}


extension MainViewController: MainPosterDelegate {
    func didSwipePoster(index: Int, vc: UIPageViewController, vcData: [UIViewController]) {
        currentPage = index
        if let pageControlButtonView = mainView.mainCollectionView.supplementaryView(forElementKind: PageControlButtonView.elementKinds, at: IndexPath(item: 0, section: 0)) as? PageControlButtonView {
            pageControlButtonView.index = currentPage
        }
    }
}

extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch dataSource[section] {
        case .mainContents:
            return 1
        case .recommendedContents:
            return recommendData.count
        case .deadlineContents:
            return deadlineData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch dataSource[indexPath.section] {
        case .mainContents:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPosterCell.identifier, for: indexPath) as? MainPosterCell else { return UICollectionViewCell() }
            cell.setPageVC(imageData: mainData)
            cell.delegate = self
            return cell
            
        case .recommendedContents:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCell.identifier, for: indexPath) as? RecommendCell else { return UICollectionViewCell() }
            cell.setCell(contents: recommendData[indexPath.row])
            return cell
            
        case .deadlineContents:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCell.identifier, for: indexPath) as? RecommendCell else { return UICollectionViewCell() }
            cell.setCell(contents: deadlineData[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == HeaderView.elementKinds {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifier, for: indexPath) as? HeaderView else { return UICollectionReusableView() }
            switch dataSource[indexPath.section] {
            case .mainContents:
                return header
            case .recommendedContents:
                header.bindTitle(headerTitle: "회원님을 위한 추천!")
            case .deadlineContents:
                header.bindTitle(headerTitle: "마감 임박!")
            }
            return header
        } else if kind == PageControlButtonView.elementKinds {
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PageControlButtonView.identifier, for: indexPath) as? PageControlButtonView else { return UICollectionReusableView() }
                footer.buttonCount = mainData.count
            return footer
        } else {
            return UICollectionReusableView()
        }
    }
}
