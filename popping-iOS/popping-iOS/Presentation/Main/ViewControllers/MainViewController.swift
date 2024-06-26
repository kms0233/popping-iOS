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
    
    private lazy var mainCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.makeFlowLayout())
    private let navigationBarView = NavigationBarView()
    
    private var mainData: [Contents] = Contents.posterImages.map { Contents(image: $0, title: "", location: "", date: "") }
    private var recommendData: [Contents] = Contents.generateDummyContents()
    private var deadlineData: [Contents] = Contents.generateDummyContents()
    private let dataSource: [MainSection] = MainSection.dataSource
    private var prevValue: Int = 0
    private var newValue: Int = 0
    private var currentPage: Int = 0 {
        didSet {
            prevValue = oldValue
            newValue = currentPage
        }
    }
    
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
        self.view.addSubviews(mainCollectionView, navigationBarView)
    }
    
    private func setLayout() {
        mainCollectionView.snp.makeConstraints {
            $0.top.equalTo(navigationBarView.snp.bottom)
            $0.bottom.trailing.leading.equalToSuperview()
        }
        navigationBarView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(108)
        }
    }
    
    private func setStyle() {
        self.navigationController?.navigationBar.isHidden = true
        mainCollectionView.do {
            $0.backgroundColor = .white
            $0.showsVerticalScrollIndicator = false
            $0.contentInsetAdjustmentBehavior = .never
        }
    }
    
    private func setDelegate() {
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
    }
    
    private func registerCell() {
        mainCollectionView.do {
            $0.register(MainPosterCell.self, forCellWithReuseIdentifier: MainPosterCell.identifier)
            $0.register(RecommendCell.self, forCellWithReuseIdentifier: RecommendCell.identifier)
            $0.register(HeaderView.self, forSupplementaryViewOfKind: HeaderView.elementKinds, withReuseIdentifier: HeaderView.identifier)
            $0.register(PageControlButtonView.self, forSupplementaryViewOfKind: PageControlButtonView.elementKinds, withReuseIdentifier: PageControlButtonView.identifier)
        }
    }
    
    private func makeFlowLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { section, _ -> NSCollectionLayoutSection? in
            switch self.dataSource[section] {
            case .mainContents: return self.makeMainContentsLayout()
            case .recommendedContents, .deadlineContents: return self.makeRecommendLayout()
            }
        }
    }
    
    private func makeMainContentsLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        let footer = makePageControlButtonView()
        section.boundarySupplementaryItems = [footer]
        
        return section
    }
    
    private func makeRecommendLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(140/375), heightDimension: .absolute(240))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0)
        
        let header = makeHeaderView()
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    private func makeHeaderView() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(25))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: HeaderView.elementKinds, alignment: .top)
        return header
    }
    
    private func makePageControlButtonView() -> NSCollectionLayoutBoundarySupplementaryItem {
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(15))
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: PageControlButtonView.elementKinds, alignment: .bottom)
        return footer
    }
}

extension MainViewController: PageControlButtonDelegate {
    func didTapControlButton(index: Int) {
        currentPage = index
        let direction: UIPageViewController.NavigationDirection = prevValue < newValue ? .forward : .reverse
        for cell in mainCollectionView.visibleCells {
            if let mainPosterCell = cell as? MainPosterCell {
                mainPosterCell.pageVC.setViewControllers([mainPosterCell.vcData[currentPage]], direction: direction, animated: true, completion: nil)
            }
        }
    }
}

extension MainViewController: MainPosterDelegate {
    func didSwipePoster(index: Int, vc: UIPageViewController, vcData: [UIViewController]) {
        currentPage = index
        if let pageControlButtonView = mainCollectionView.supplementaryView(forElementKind: PageControlButtonView.elementKinds, at: IndexPath(item: 0, section: 0)) as? PageControlButtonView {
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
            footer.delegate = self
            return footer
        } else {
            return UICollectionReusableView()
        }
    }
}
