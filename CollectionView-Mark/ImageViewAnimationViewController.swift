//
//  ImageViewAnimationViewController.swift
//  CollectionView-Mark
//
//  Created by 李京珂 on 2019/10/23.
//  Copyright © 2019 李京珂. All rights reserved.
//

import UIKit

class ImageViewAnimationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureData()
    }
        
    @objc fileprivate func btnAction(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            view1.startAnimating()
        case 2:
            let im = UIImage.animatedImageNamed("voice", duration: 2)
            view2.image = im
        case 3:
            breathingAction()
        default:
            break
        }
    }
    
    fileprivate func breathingAction() {
        var arr = [UIImage]()
        let w: CGFloat = 18
        for i in 0..<6 {
            UIGraphicsBeginImageContextWithOptions(CGSize(width: w, height: w), false, 0)
            let context = UIGraphicsGetCurrentContext()!
            context.setFillColor(UIColor.randomColor().cgColor)
            let ii = CGFloat(i)
            let rect = CGRect(x: ii, y: ii, width: w-ii*2, height: w-ii*2)
            context.addEllipse(in: rect)
            context.fillPath()
            let im = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            arr.append(im)
        }
        let im = UIImage.animatedImage(with: arr, duration: 0.5)
        breathingBtn.setImage(im, for: .normal)
        
    }
    
    fileprivate func configureData() {
        let rabbit = #imageLiteral(resourceName: "rabbit")
        UIGraphicsBeginImageContextWithOptions(rabbit.size, false, 0)
        let empty = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        let arr = [rabbit, empty, rabbit, empty, rabbit]
        view1.animationImages = arr
        view1.animationDuration = 2
        view1.animationRepeatCount = 3
    }
    
    
    lazy var view1: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "rabbit")
        view.backgroundColor = .randomColor()
        return view
    }()
    
    lazy var view2: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "rabbit")
        view.backgroundColor = .randomColor()
        return view
    }()
    
    lazy var btn1: UIButton = {
        let btn = UIButton()
        btn.setTitle("ImageView Animation", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.tag = 1
        btn.addTarget(self, action: #selector(btnAction(_:)), for: .touchDown)
        return btn
    }()
    
    lazy var btn2: UIButton = {
        let btn = UIButton()
        btn.setTitle("Imageview Animation1", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.tag = 2
        btn.addTarget(self, action: #selector(btnAction(_:)), for: .touchDown)
        return btn
    }()
    
    lazy var breathingBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Touch Me", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.layer.backgroundColor = UIColor.randomColor().cgColor
        btn.tag = 3
        btn.addTarget(self, action: #selector(btnAction(_:)), for: .touchDown)
        return btn
    }()
    
}

extension ImageViewAnimationViewController {
    
    fileprivate func configureUI() {
        view.backgroundColor = .white
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(btn1)
        view.addSubview(btn2)
        view.addSubview(breathingBtn)
        
        view1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.size.equalTo(80)
        }
        
        btn1.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.centerY.equalTo(view1)
        }
        
        view2.snp.makeConstraints { (make) in
            make.top.equalTo(view1.snp.bottom).offset(15)
            make.right.size.equalTo(view1)
        }
        
        btn2.snp.makeConstraints { (make) in
            make.left.equalTo(btn1)
            make.centerY.equalTo(view2)
        }
        
        breathingBtn.snp.makeConstraints { (make) in
            make.top.equalTo(btn2.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
    }
    
}
