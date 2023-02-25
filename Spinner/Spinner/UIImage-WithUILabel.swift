//
//  UIImage-WithUILabel.swift
//  Spinner
//
//  Created by Logan Melton on 1/28/23.
//

import UIKit
 
extension UIImage {
  class func imageWithLabel(label: UILabel) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(label.bounds.size, false, 1.0)
//    label.adjustsFontSizeToFitWidth = true
    label.layer.render(in: UIGraphicsGetCurrentContext()!)
    let img = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    guard let img = img else { return UIImage() }
    return img
  }
}

