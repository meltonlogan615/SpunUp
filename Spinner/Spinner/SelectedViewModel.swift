//
//  SelectedViewModel.swift
//  Spinner
//
//  Created by Logan Melton on 1/31/23.
//

import UIKit

class SelectedViewModel {
  var host: WheelViewController!
  var view: SelectedView!
}

extension SelectedViewModel {
  func showWinner() {
    guard let wheel = host.wheelView else {
      print("Nah playa")
      return }
//    if wheel.completed {
//      let index = host.wheelView.selectionIndex
//      let selected = host.data.dataTwo[index]
//      view.message = ""
//      view.selected = selected
//      print(selected)      
//    }
  }
}
