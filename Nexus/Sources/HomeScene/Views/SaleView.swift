//
//  SaleView.swift
//  
//
//  Created by Владислав on 14.01.2024.
//

import UIKit

final class SaleView: UIView {
    enum Constants {
        static let idSaleCell: String = "idSaleCell"
        static let collectionViewSizeSpacing: CGFloat = 0.0
    }
    
    private let salesImages: [String] = [
        "salesBurger", "salesPizza", "salesWok"
    ]
    
    //MARK: - UI
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.backgroundColor = .none
        return collectionView
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(SaleCollectionViewCell.self, forCellWithReuseIdentifier: Constants.idSaleCell)
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDelegates() {
        collectionView.dataSource = self
    }
    
    private func setupViews() {
        backgroundColor = .none
        layer.cornerRadius = 10
        addSubview(collectionView)
        collectionView.showsHorizontalScrollIndicator = true
    }
    
}

//MARK: - setConstraints
private extension SaleView {
     func setConstraints() {
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.collectionViewSizeSpacing),
                collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.collectionViewSizeSpacing),
                collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.collectionViewSizeSpacing),
                collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.collectionViewSizeSpacing)
            ])
    }
}

//MARK: - UICollectionViewDataSource

extension SaleView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        salesImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.idSaleCell, for: indexPath) as? SaleCollectionViewCell else { return UICollectionViewCell() }
        
        let imageName = salesImages[indexPath.item]
        cell.configureCell(imageName: imageName)
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension SaleView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 9.4,
               height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        3
    }
}
