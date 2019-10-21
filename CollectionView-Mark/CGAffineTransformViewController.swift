//
//  CGAffineTransformViewController.swift
//  CollectionView-Mark
//
//  Created by 李京珂 on 2019/10/21.
//  Copyright © 2019 李京珂. All rights reserved.
//

import UIKit

class CGAffineTransformViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    fileprivate func configureUI() {
        view.addSubview(mainView)
        mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        mainView.addSubview(squreView)
    }
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var squreView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        view.backgroundColor = .red
        return view
    }()
    
}
