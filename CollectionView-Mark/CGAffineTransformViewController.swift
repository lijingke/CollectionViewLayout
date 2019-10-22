//
//  CGAffineTransformViewController.swift
//  CollectionView-Mark
//
//  Created by 李京珂 on 2019/10/21.
//  Copyright © 2019 李京珂. All rights reserved.
//

import UIKit

class CGAffineTransformViewController: UIViewController {
    
    lazy var subView1 = UIView()
    lazy var subView2 = UIView()
    lazy var subView3 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBtn()
        configureUI()
    }
    
    fileprivate func configureUI() {
        view.backgroundColor = .white
        view.addSubview(squreView)
        squreView.center = view.center
        
        subView1.backgroundColor = .green
        
        subView2.backgroundColor = .gray
        
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
            self.subView1.transform = CGAffineTransform(scaleX: -2, y: -3)
            // 平移转换
            self.subView2.transform = CGAffineTransform(translationX: 20, y: 20).inverted()
            // 旋转转换
            self.subView3.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4).inverted()
        }
        
        view.clipsToBounds = true
        
    }

    fileprivate func configureBtn() {
        var originX:CGFloat = 30
        let btnW = (view.frame.width - 4 * 30) / 3
        for i in 0...2 {
            let btn = UIButton(type: .custom)
            btn.addTarget(self, action: #selector(btnAction(sender:)), for: .touchDown)
            btn.tag = i
            switch i {
            case 0:
                btn.setTitle("平移转换", for: .normal)
            case 1:
                btn.setTitle("缩放转换", for: .normal)
            case 2:
                btn.setTitle("旋转转换", for: .normal)
            default:
                break
            }
            btn.backgroundColor = UIColor.randomColor()
            btn.frame = CGRect(x: originX, y: 30, width: btnW, height: 60)
            view.addSubview(btn)
            originX = 30 + (btnW + 30) * CGFloat(i + 1)
        }
    }
    
    @objc fileprivate func btnAction(sender:UIButton) {
        switch sender.tag {
        case 0:
            print("平移转换")
            UIView.animate(withDuration: 3) {
                // 接着改变
//                self.subView1.transform = self.subView1.transform.translatedBy(x: 50, y: 50)
                // 重新改变
                self.subView1.transform = CGAffineTransform(translationX: 0, y: 0)
            }
        case 1:
            print("缩放转换")
            UIView.animate(withDuration: 3) {
//                self.subView1.transform = self.subView3.transform.inverted()
                self.subView1.transform = .identity
                
            }
        case 2:
            print("旋转转换")
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                UIView.animate(withDuration: 1) {
                    self.subView3.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2).concatenating(self.subView3.transform)
                }
            }
            
        default:
            break
        }
    }
    
    lazy var squreView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        view.backgroundColor = .red
        return view
    }()
    
}

