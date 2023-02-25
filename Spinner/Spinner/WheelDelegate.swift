//
//  WheelDelegate.swift
//  Spinner
//
//  Created by Logan Melton on 1/28/23.
//

import UIKit

protocol WheelDelegate: NSObject {
  func shouldSelectObject() -> Int?
  func finishedSelecting(index: Int? , error: WheelError?)
}
