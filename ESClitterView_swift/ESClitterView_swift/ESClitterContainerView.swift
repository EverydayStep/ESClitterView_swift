//
//  ESClitterContainerCell.swift
//  ESClitterView_swift
//
//  Created by codeLocker on 2020/6/12.
//  Copyright © 2020 codeLocker. All rights reserved.
//

import UIKit
import SnapKit

class ESClitterContainerView: UIView {
    
    static let itemWidth: CGFloat = UIScreen.main.bounds.size.width / 3.0
    static let itemHeight: CGFloat = UIScreen.main.bounds.size.width / 4.0
    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize.init(width: ESClitterContainerView.itemWidth, height: ESClitterContainerView.itemHeight)
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.register(ESClitterCell.self, forCellWithReuseIdentifier: String(describing: ESClitterCell.self))
        collectionView.backgroundView?.backgroundColor = UIColor.white
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    var datas: [ESClitter]? {
        didSet {
            guard let datas = datas, datas.count > 0 else {
                return
            }
            self.collectionView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadUI()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LoadUI
    private func loadUI() {
        self.addSubview(self.collectionView)
    }
    
    private func layout() {
        self.collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension ESClitterContainerView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datas?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ESClitterCell.self), for: indexPath) as? ESClitterCell else {
            return ESClitterCell()
        }
        cell.clitter = self.datas?[indexPath.row]
        return cell
    }
}
