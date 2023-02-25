//
//  WheelError.swift
//  Spinner
//
//  Created by Logan Melton on 1/26/23.
//

import UIKit

class WheelError: Error {
  let message: String
  let code: Int
  
  init(message: String, code: Int) {
    self.message = message
    self.code = code
  }
}
