//
//  WheelAnimation.swift
//  Spinner
//
//  Created by Logan Melton on 1/30/23.
//

import AVFoundation
import UIKit

class WheelAnimation {
  var player: AVAudioPlayer!
  var delay: Double = 0
  var currentSlice: Int = 0
  let soundID: SystemSoundID = 1104
}


// MARK: - SPIN ANIMATIONS
extension WheelAnimation {
  // START OFF GOING FAST
  func fastSpin<T: Sequence>(with items: T?) -> CABasicAnimation {
    guard let items = items else { return CABasicAnimation() }
    var count = 0
    for _ in items { count += 1}
    let fastSpin = CABasicAnimation.init(keyPath: "transform.rotation")
    fastSpin.duration = 0.7
    fastSpin.repeatCount = 3
    #warning("TODO #1: Needs to make sound as each slice passes by indicator")
    fastSpin.fromValue = NSNumber.init(floatLiteral: 0)
    fastSpin.toValue = NSNumber.init(floatLiteral: .pi * 2)
    fastSpin.beginTime = CACurrentMediaTime() + delay
    delay += Double(fastSpin.duration) * Double(fastSpin.repeatCount)
    return fastSpin
  }
  
  // SLOW DOWN A BIT
  func slowSpin<T: Sequence>(with items: T?)  -> CABasicAnimation  {
    guard let items = items else { return CABasicAnimation() }
    var count = 0
    for _ in items { count += 1}
    let slowSpin = CABasicAnimation.init(keyPath: "transform.rotation")
    slowSpin.fromValue = NSNumber.init(floatLiteral: 0)
    slowSpin.toValue = NSNumber.init(floatLiteral: .pi * 2)
    slowSpin.isCumulative = true
    slowSpin.beginTime = CACurrentMediaTime() + delay
    slowSpin.repeatCount = 1
    slowSpin.duration = 1.5
    #warning("TODO #2: Needs to make sound as each slice passes by indicator")
    delay += Double(slowSpin.duration) * Double(slowSpin.repeatCount)
    return slowSpin
  }
  
  // ROTATE TO THE FINAL SELECTION
  func selectionSpin(delegate: CAAnimationDelegate, duration selectionSpinDuration: Double, selectionAngle: CGFloat) -> CABasicAnimation {
    let selectionSpin = CABasicAnimation.init(keyPath: "transform.rotation")
    selectionSpin.delegate = delegate
    selectionSpin.fromValue = NSNumber.init(floatLiteral: 0)
    selectionSpin.toValue = NSNumber.init(floatLiteral: Double(selectionAngle))
    selectionSpin.duration = selectionSpinDuration
    selectionSpin.beginTime = CACurrentMediaTime() + delay
    selectionSpin.isCumulative = true
    selectionSpin.repeatCount = 1
    selectionSpin.isRemovedOnCompletion = false
    selectionSpin.fillMode = .forwards
    return selectionSpin
  }
}




