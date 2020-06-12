//
//  ESClitterCell.swift
//  ESClitterView_swift
//
//  Created by codeLocker on 2020/6/12.
//  Copyright © 2020 codeLocker. All rights reserved.
//

import UIKit
import SnapKit

class ESClitterCell: UICollectionViewCell {
    
    fileprivate lazy var titleLab: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.init(red: 155/255.0, green: 155/255.0, blue: 155/255.0, alpha: 1)
        lab.font = UIFont.systemFont(ofSize: 15)
        lab.textAlignment = .center
        return lab
    }()
    
    fileprivate lazy var valueLab: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.init(red: 31/255.0, green: 31/255.0, blue: 31/255.0, alpha: 1)
        lab.font = UIFont.systemFont(ofSize: 13)
        lab.textAlignment = .center
        return lab
    }()
    
    var clitter: ESClitter? {
        didSet {
            self.titleLab.text = clitter?.name
            self.valueLab.text = clitter?.value
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
        self.contentView.addSubview(self.titleLab)
        self.contentView.addSubview(self.valueLab)
    }
    
    private func layout() {
        self.titleLab.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(10)
            make.bottom.equalTo(self.contentView.snp.centerY).offset(-3)
        }
        self.valueLab.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.contentView.snp.centerY).offset(3)
        }
    }
}
