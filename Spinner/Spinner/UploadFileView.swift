//
//  UploadFileView.swift
//  Spinner
//
//  Created by Logan Melton on 1/30/23.
//

import UIKit

class UploadFileView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension UploadFileView {
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layout() {
    
  }
}
