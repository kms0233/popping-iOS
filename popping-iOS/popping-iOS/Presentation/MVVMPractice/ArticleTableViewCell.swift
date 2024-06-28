//
//  ArticleTableViewCell.swift
//  popping-iOS
//
//  Created by 김민서 on 6/28/24.
//

import UIKit

import SnapKit

//View
//테이블 뷰 셀
class ArticleTableViewCell: UITableViewCell {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        contentView.addSubviews(titleLabel,descriptionLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(10)
            $0.left.equalTo(contentView).offset(10)
            $0.right.equalTo(contentView).offset(-10)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.left.equalTo(contentView).offset(10)
            $0.right.equalTo(contentView).offset(-10)
            $0.bottom.equalTo(contentView).offset(-10)
        }
    }

  
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view)
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // 클래스 등록
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "ArticleTableViewCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 // 예시를 위해 임의의 값을 반환합니다.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        cell.titleLabel.text = "Title \(indexPath.row)"
        cell.descriptionLabel.text = "Description \(indexPath.row)"
        return cell
    }
}
