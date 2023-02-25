//
//  CircleViewModel.swift
//  Spinner
//
//  Created by Logan Melton on 1/22/23.
//

import UIKit

class CircleViewModel {
  var circleView: CircleView!
  var dataCount: Int!
  
  func spinWheel() {
    circleView.rotate360(repetitions: Float(2))
  }
  
  func selectRandomElement(from data: [String: Float]) {
    spinWheel()
    let options = Array(data.keys)
    let count = options.count
  }
}
