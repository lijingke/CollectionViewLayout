//
//  GetLocationViewController.swift
//  CollectionView-Mark
//
//  Created by 李京珂 on 2019/11/7.
//  Copyright © 2019 李京珂. All rights reserved.
//

import UIKit
import CoreLocation

class GetLocationViewController: UIViewController {
    
    var currentLocation: CLLocation!
    var lock = NSLock()
    
    lazy var locationManager: CLLocationManager = {
        let location = CLLocationManager()
        location.delegate = self
        location.desiredAccuracy = kCLLocationAccuracyBest
        location.distanceFilter = 50
        return location
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
    
    fileprivate func callUserLocation() {
        locationManager.startUpdatingLocation()
        print("Start Location")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @objc fileprivate func checkLocationAuthority() {
        openLocationServiceWithBlock { [weak self](authority) in
            
            guard let weakSelf = self else {
                return
            }
            
            if authority == false {
                if CLLocationManager.authorizationStatus() == .notDetermined {
                    self?.locationManager.requestAlwaysAuthorization()
                }else {
                    let alertCon = UIAlertController(title: "获取定位失败", message: "请跳转到设置页面开启定位", preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "取消", style: .cancel) { (action) in
                        let callUrl = URL(string: "tel://110")
                        UIApplication.shared.open(callUrl!, options: [:], completionHandler: nil)
                    }
                    let okAction = UIAlertAction(title: "设定", style: .default) { (action) in
                        let openUrl = URL(string: UIApplication.openSettingsURLString)
                        UIApplication.shared.open(openUrl!, options: [:]) { (finish) in
                            print("Finish")
                        }
                    }
                    alertCon.addAction(cancelAction)
                    alertCon.addAction(okAction)
                    weakSelf.present(alertCon, animated: true) {
                        print("End")
                    }
                }
            }else {
                self?.callUserLocation()
            }
        }
        
    }
    
    fileprivate func configureUI() {
        view.addSubview(getLocationBtn)
        getLocationBtn.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        getLocationBtn.setNeedsLayout()
        getLocationBtn.layoutIfNeeded()
        getLocationBtn.layer.cornerRadius = getLocationBtn.frame.height / 2
    }
    
    lazy var getLocationBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Click Me", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        btn.addTarget(self, action: #selector(checkLocationAuthority), for: .touchDown)
        return btn
    }()
    
}

extension GetLocationViewController: CLLocationManagerDelegate {
    
    func openLocationServiceWithBlock(action: @escaping ((Bool)->())) {
        var isOpen = false
        if CLLocationManager.locationServicesEnabled() && (CLLocationManager.authorizationStatus() != .denied && CLLocationManager.authorizationStatus() != .notDetermined) {
            isOpen = true
        }
        action(isOpen)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        lock.lock()
        currentLocation = locations.last
        print("定位经度为：\(currentLocation.coordinate.latitude)")
        print("定位纬度为：\(currentLocation.coordinate.longitude)")
        print("定位海拔为：\(currentLocation.altitude)")
//        lock.unlock()
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("定位出错啦！！\(error)")
    }
}
