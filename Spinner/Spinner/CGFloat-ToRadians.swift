//
//  CGFloat-ToRadians.swift
//  Spinner
//
//  Created by Logan Melton on 1/27/23.
//

import CoreGraphics

extension CGFloat {
  static func toRadians(_ float: CGFloat) -> CGFloat {
    return (float * CGFloat.pi) / 180
  }
}

