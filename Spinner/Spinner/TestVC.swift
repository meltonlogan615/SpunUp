//
//  TestVC.swift
//  Spinner
//
//  Created by Logan Melton on 1/30/23.
//

import UIKit

class TestVC: UIViewController {
  var bgImg: UIImageView!
  
  let selectedView = SelectedView()
  let viewModel = WheelAnimation()
  let startButton = UIButton()
  override func viewDidLoad() {
    super.viewDidLoad()
    selectedView.message = "FARTS!"
    selectedView.selected = "FUCK!!"
    style()
    layout()
//    viewModel.showSelected()
  }
}

extension TestVC {
  func style() {
    bgImg = UIImageView()
    bgImg.translatesAutoresizingMaskIntoConstraints = false
    bgImg.image = UIImage(named: "skull")
    bgImg.contentMode = .scaleAspectFill
    
    startButton.translatesAutoresizingMaskIntoConstraints = false
    startButton.setTitle("Start", for: [])
    startButton.addTarget(self, action: #selector(runAnimation), for: .touchUpInside)
    selectedView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layout() {
    
    view.addSubview(bgImg)
    NSLayoutConstraint.activate([
      bgImg.topAnchor.constraint(equalTo: view.topAnchor),
      bgImg.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      bgImg.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      bgImg.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
    
    view.addSubview(startButton)
    NSLayoutConstraint.activate([
      startButton.topAnchor.constraint(equalTo: view.topAnchor),
      startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
  
  @objc
  func runAnimation() {
    view.addSubview(selectedView)
    NSLayoutConstraint.activate([
      selectedView.topAnchor.constraint(equalTo: view.topAnchor),
      selectedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      selectedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      selectedView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
}
