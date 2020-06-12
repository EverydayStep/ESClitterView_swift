//
//  ViewController.swift
//  ESClitterView_swift
//
//  Created by codeLocker on 2020/6/12.
//  Copyright © 2020 codeLocker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let clitterView = ESClitterView.init()
        
        var section1 = ESClitterSection()
        section1.title = "section1"
        section1.clitters = [
            ESClitter.init(name: "1-1", value: "1-1V"),
            ESClitter.init(name: "1-2", value: "1-2V"),
            ESClitter.init(name: "1-3", value: "1-3V"),
            ESClitter.init(name: "1-4", value: "1-4V"),
            ESClitter.init(name: "1-5", value: "1-5V"),
            ESClitter.init(name: "1-6", value: "1-6V")
        ]
        
        var section2 = ESClitterSection()
        section2.title = "section2"
        section2.clitters = [
            ESClitter.init(name: "2-1", value: "2-1V"),
            ESClitter.init(name: "2-2", value: "2-2V"),
        ]
        
        var section3 = ESClitterSection()
        section3.title = "section3"
        section3.clitters = [
            ESClitter.init(name: "3-1", value: "1-1V"),
            ESClitter.init(name: "3-2", value: "1-2V"),
            ESClitter.init(name: "3-3", value: "1-3V"),
            ESClitter.init(name: "3-4", value: "1-4V"),
            ESClitter.init(name: "3-5", value: "1-5V"),
            ESClitter.init(name: "3-6", value: "1-6V"),
            ESClitter.init(name: "3-7", value: "1-7V")
        ]
        
        clitterView.datas = [section1, section2, section3]
        
        self.view.addSubview(clitterView)
        clitterView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().inset(100)
//            make.height.equalTo(280)
        }
    }


}

