//
//  WheelViewModel.swift
//  Spinner
//
//  Created by Logan Melton on 1/31/23.
//

import AVFoundation
import UIKit

class WheelViewModel {
  var completed = false
  var player: AVAudioPlayer!
  
  func clickyClick(duration: TimeInterval, repetitions: Int) {
    let id: SystemSoundID = 1104
    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
      AudioServicesPlaySystemSound(id)
    }
//    guard let path = Bundle.main.path(forResource: "bubble.wav", ofType: nil) else {
//      print("No audio hr'r")
//      return
//    }
//
//    let url = URL(filePath: path)
//
//    do {
//      player = try AVAudioPlayer(contentsOf: url)
//
//    } catch {
//      print("Bugger Off")
//    }
//    guard let player = player else { return }
//    print("made it")
//    player.enableRate = true
//    player.rate = 3
//    player.numberOfLoops = 10
//    player.volume = .infinity
//    player.play()
  }
  
}

