//
//  SelectedView.swift
//  Spinner
//
//  Created by Logan Melton on 1/28/23.
//

import UIKit

class SelectedView: UIView {

  var blurredBG: UIVisualEffectView!
  var borderView: UIView!
  var messageLabel: UILabel!
  var message: String!
  var selectedLabel: UILabel!
  var selected: String!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension SelectedView {
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .clear
    


    let bgFilter = UIBlurEffect(style: .regular)
    blurredBG = UIVisualEffectView(effect: bgFilter)
    blurredBG.translatesAutoresizingMaskIntoConstraints = false
    
    borderView = UIView()
    borderView.translatesAutoresizingMaskIntoConstraints = false
    borderView.layer.borderWidth = 12
    borderView.layer.borderColor = UIColor.label.cgColor
    borderView.layer.cornerRadius = 8
    borderView.clipsToBounds = true
    borderView.backgroundColor = .systemPink
    
    messageLabel = UILabel()
    messageLabel.translatesAutoresizingMaskIntoConstraints = false
    messageLabel.font = .preferredFont(forTextStyle: .headline)
    messageLabel.numberOfLines = 0
    messageLabel.text = message
    
    selectedLabel = UILabel()
    selectedLabel.translatesAutoresizingMaskIntoConstraints = false
    selectedLabel.font = .preferredFont(forTextStyle: .largeTitle)
    selectedLabel.numberOfLines = 0
    selectedLabel.text = selected
  }
  
  func layout() {

    
    addSubview(blurredBG)
    NSLayoutConstraint.activate([
      blurredBG.topAnchor.constraint(equalTo: topAnchor),
      blurredBG.leadingAnchor.constraint(equalTo: leadingAnchor),
      blurredBG.trailingAnchor.constraint(equalTo: trailingAnchor),
      blurredBG.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
    
    let multiplier = CGFloat(36)
    addSubview(borderView)
    NSLayoutConstraint.activate([
      borderView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: multiplier),
      borderView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: multiplier),
      trailingAnchor.constraint(equalToSystemSpacingAfter: borderView.trailingAnchor, multiplier: multiplier),
      bottomAnchor.constraint(equalToSystemSpacingBelow: borderView.bottomAnchor, multiplier: multiplier)
    ])
  }
}

// MARK: - ANIMATION PROCESS
// #1 - begin spinning counter clockwise
// #2 - increase scale
// #3 - exceeds 1:1 scale, but then returns to it.
