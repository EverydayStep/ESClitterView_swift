//
//  ESClitterView.swift
//  ESClitterView_swift
//
//  Created by codeLocker on 2020/6/12.
//  Copyright © 2020 codeLocker. All rights reserved.
//

import UIKit
import SnapKit

public class ESClitterView: UIView {

    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    fileprivate lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    fileprivate lazy var titleLab: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.init(red: 31/255.0, green: 31/255.0, blue: 31/255.0, alpha: 1)
        lab.textAlignment = .center
        lab.font = UIFont.systemFont(ofSize: 15)
        return lab
    }()
    
    
    fileprivate var clitterContainerHeights = [CGFloat]()
    fileprivate var currentPageIndex: Int = 0
    
    public var datas: [ESClitterSection]? {
        didSet {
            guard let datas = datas, datas.count > 0 else {
                return
            }
            self.loadClitterContainerView()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadUI()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LoadUI
    private func loadUI() {
        self.addSubview(self.titleLab)
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.containerView)
    }
    
    private func layout() {
        self.titleLab.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(30)
        }
        self.scrollView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(self.titleLab.snp.bottom)
        }
        self.containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(self.scrollView)
        }
    }
}

extension ESClitterView {
    func loadClitterContainerView() {
        var preClitterContainerView: ESClitterContainerView?
        for index in 0 ..< self.datas!.count {
            let clitterContainerView = ESClitterContainerView()
            let clitters = self.datas?[index].clitters
            clitterContainerView.datas = clitters
            
            // 保存每一页的高度
            let lines = ceil( CGFloat(clitters?.count ?? 0) / 3.0)
            self.clitterContainerHeights.append(CGFloat(lines * ESClitterContainerView.itemHeight))
            
            self.containerView.addSubview(clitterContainerView)
            clitterContainerView.snp.makeConstraints { (make) in
                make.top.bottom.equalToSuperview()
                make.width.equalTo(UIScreen.main.bounds.size.width)
                if let _ = preClitterContainerView {
                    make.left.equalTo(preClitterContainerView!.snp.right)
                } else {
                    make.left.equalToSuperview()
                }
                if index == self.datas!.count - 1 {
                    //last
                    make.right.equalToSuperview()
                }
            }
            preClitterContainerView = clitterContainerView
        }
        self.updateHeight()
        self.updateTitle()
    }
    
    func updateHeight() {
        self.snp.updateConstraints { (make) in
            let height = self.clitterContainerHeights[self.currentPageIndex] + 30
            make.height.equalTo(height)
        }
    }
    
    func updateTitle() {
        let clitterSection = self.datas?[self.currentPageIndex]
        self.titleLab.text = clitterSection?.title
    }
}

extension ESClitterView: UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset_x = scrollView.contentOffset.x
        let page = Int(ceil(offset_x / UIScreen.main.bounds.size.width))
        if page == self.currentPageIndex {
            return
        }
        self.currentPageIndex = page
        self.updateHeight()
        self.updateTitle()
    }
}
