//
//  UIColor-Random.swift
//  Spinner
//
//  Created by Logan Melton on 1/30/23.
//

import UIKit


extension CGFloat {
  static func random() -> CGFloat {
    return CGFloat(arc4random()) / CGFloat(UInt32.max)
  }
}

extension UIColor {
  static func random() -> UIColor {
    return UIColor(red:   .random(),
                   green: .random(),
                   blue:  .random(),
                   alpha: 1.0)
  }
}

