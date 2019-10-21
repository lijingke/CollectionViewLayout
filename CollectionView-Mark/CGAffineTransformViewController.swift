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
        view.backgroundColor = .white
        view.addSubview(squreView)
        squreView.center = view.center
        
        let subView1 = UIView()
        subView1.backgroundColor = .green
        
        let subView2 = UIView()
        subView2.backgroundColor = .gray
        
        let subView3 = UIView()
        subView3.backgroundColor = .purple
    
        view.addSubview(subView1)
        view.addSubview(subView2)
        view.addSubview(subView3)
        
        subView1.snp.makeConstraints { (make) in
            make.centerX.equalTo(squreView)
            make.bottom.equalTo(squreView.snp.top)
            make.size.equalTo(40)
        }
       subView2.snp.makeConstraints { (make) in
             make.centerX.equalTo(squreView)
             make.bottom.equalTo(squreView.snp.top)
             make.size.equalTo(40)
         }
        subView3.snp.makeConstraints { (make) in
             make.centerX.equalTo(squreView)
             make.bottom.equalTo(squreView.snp.top)
             make.size.equalTo(40)
         }
        
        
        view.bringSubviewToFront(squreView)
        
        UIView.animate(withDuration: 5) {
            
            // 缩放转换
            subView1.transform = CGAffineTransform(scaleX: 2, y: 3)
            // 平移转换
            subView2.transform = CGAffineTransform(translationX: 20, y: 20)
            // 旋转转换
            subView3.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        }
        
    }
    
    lazy var squreView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        view.backgroundColor = .red
        return view
    }()
    
}

