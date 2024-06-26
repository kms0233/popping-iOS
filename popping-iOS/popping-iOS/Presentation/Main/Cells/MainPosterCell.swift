//
//  MainPosterCell.swift
//  popping-iOS
//
//  Created by 김민서 on 6/26/24.
//

import UIKit

import SnapKit
import Then

protocol MainPosterDelegate: AnyObject {
    func didSwipePoster(index: Int, vc: UIPageViewController, vcData: [UIViewController])
}

final class MainPosterCell: UICollectionViewCell {
    

    let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let gradientView = UIImageView(image: .gradient)
    private let rankView = UIImageView(image: .rank)
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()

    var vcData: [UIViewController] = []
    weak var delegate: MainPosterDelegate?
    static let identifier: String = "MainPosterCell"
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setHierarchy()
        setLayout()
        setStyle()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPageVC(imageData: [Contents]) {
        vcData = imageData.map {
            let vc = UIViewController()
            let imageView = UIImageView()
            imageView.image = $0.image
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            vc.view.addSubview(imageView)
            imageView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
            return vc
        }
        setVCInPageVC()
    }
}

// MARK: - Private Methods
private extension MainPosterCell {
    func setHierarchy() {
        self.addSubviews(pageVC.view, gradientView,rankView, titleLabel, dateLabel)
    }
    
    func setLayout() {
        pageVC.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        gradientView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        rankView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(10)
            $0.width.height.equalTo(44)
        }
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(27)
            $0.leading.equalToSuperview().inset(16)
        }
        dateLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(27)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
    
    func setStyle() {
        titleLabel.do{
            $0.text = "디저트의 틀을 깨다.\n원형들 팝업 스토어"
            $0.textColor = UIColor(resource: .black)
            $0.textAlignment = .center
            $0.numberOfLines = 2
            $0.font = UIFont(name: "Pretendard-Semibold", size: 20)
        }
        dateLabel.do{
            $0.text = "2023.3.1 ~ 3.31"
            $0.textColor = UIColor(resource: .black)
            $0.textAlignment = .right
            $0.numberOfLines = 1
            $0.font = UIFont(name: "Pretendard-Medium", size: 13)
        }
    }
    func setVCInPageVC() {
        if let firstVC = vcData.first {
            pageVC.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func setDelegate() {
        pageVC.delegate = self
        pageVC.dataSource = self
    }
}

extension MainPosterCell: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let currentVC = pageViewController.viewControllers?.first,
              let currentIndex = vcData.firstIndex(of: currentVC) else { return }
        self.delegate?.didSwipePoster(index: currentIndex, vc: pageViewController, vcData: vcData)
    }
}

extension MainPosterCell: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = vcData.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        return previousIndex < 0 ? nil : vcData[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = vcData.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        return nextIndex == vcData.count ? nil : vcData[nextIndex]
    }
}
