//
//  UIImage+ Extension.swift
//  CollectionView-Mark
//
//  Created by 李京珂 on 2020/1/2.
//  Copyright © 2020 李京珂. All rights reserved.
//

import UIKit

extension UIImage {
  static public func getImageWithColor(color:UIColor)->UIImage{
    let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context!.setFillColor(color.cgColor)
    context!.fill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
  }
}
