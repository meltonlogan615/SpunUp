//
//  ViewController.swift
//  Spinner
//
//  Created by Logan Melton on 1/22/23.
//

import UIKit

class ViewController: UIViewController {
  
  let test = TestData()
  let viewModel = CircleViewModel()
  var circle: CircleView!
  let colors: [UIColor] = [.red, .orange, .yellow, .green, .cyan, .purple]
  let circleFrame = CGRect(x: 0, y: 0, width: 400, height: 400)
  var dataCount: Int!
  
  private var indicator = UIImageView()
  private var indicatorSize = CGSize()
  
  var goButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    circle = CircleView(frame: circleFrame, colors: colors, strokeWidth: 2, borderColor: .label)
    viewModel.circleView = circle
    self.goButton = UIButton()
    styleCircle()
    addIndicator()
    addButton()
    dataCount = Array(test.data.keys).count
    viewModel.dataCount = dataCount
    goButton.addTarget(self, action: #selector(spinButtonTapped), for: .touchUpInside)
  }
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    if UIDevice.current.orientation.isLandscape {
      circle.frame.size.height = view.frame.width / 2
      circle.frame.size.width = circle.frame.height
      
    } else {
      circle.frame.size = spinnerSize()
      circle.frame.size.height = view.frame.height / 2
      circle.frame.size.width = circle.frame.height
    }
  }
}

extension ViewController {
  func styleCircle() {
    circle.translatesAutoresizingMaskIntoConstraints = false
    circle.center = view.center
    circle.set(data: test.data)
    
    view.addSubview(circle)
    NSLayoutConstraint.activate([
      circle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      circle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      circle.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 4),
      circle.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: circle.trailingAnchor, multiplier: 4),
      view.bottomAnchor.constraint(equalToSystemSpacingBelow: circle.bottomAnchor, multiplier: 4)
    ])
  }
  
  @objc
  func spinButtonTapped() {
    viewModel.selectRandomElement(from: test.data)
  }
  
  func spinnerSize() -> CGSize {
    var size = CGSize()
    if view.frame.height < view.frame.width {
      size.height = view.frame.height / 2
      size.width = size.height
    } else {
      size.height = view.frame.width / 2
      size.width = size.height
    }
    return size
  }
}

extension ViewController {
  func addIndicator() {
    indicatorSize = CGSize.init(width: circle.bounds.width * 0.25 ,
                                height: circle.bounds.height * 0.25)
    
    let position = CGPoint.init(x: circle.frame.maxX + 260,
                                y: circle.frame.height + 75)
    
    self.indicator.frame = CGRect.init(origin: position,
                                       size: self.indicatorSize)
    
    self.indicator.image = UIImage(systemName: "hand.point.left.fill")
    indicator.tintColor = .black
    if self.indicator.superview == nil {
      view.addSubview(self.indicator)
    }
  }
}


extension ViewController {
  func addButton() {
    let buttonContainer: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true
      view.layer.cornerRadius = 150
      view.backgroundColor = .label
      view.layer.zPosition = 50
      return view
    }()
    
    goButton.translatesAutoresizingMaskIntoConstraints = false
    var config = UIButton.Configuration.bordered()
    var attrContainer = AttributeContainer()
    attrContainer.font = .preferredFont(forTextStyle: .largeTitle)
    attrContainer.kern = 10
    config.baseForegroundColor = .systemBackground
    config.baseBackgroundColor = .label
    config.attributedTitle = AttributedString(" SPIN", attributes: attrContainer)
    goButton.configuration = config
    
    buttonContainer.addSubview(goButton)
    NSLayoutConstraint.activate([
      goButton.topAnchor.constraint(equalTo: buttonContainer.topAnchor),
      goButton.leadingAnchor.constraint(equalTo: buttonContainer.leadingAnchor),
      goButton.trailingAnchor.constraint(equalTo: buttonContainer.trailingAnchor),
      goButton.bottomAnchor.constraint(equalTo: buttonContainer.bottomAnchor)
    ])
    
    view.addSubview(buttonContainer)
    NSLayoutConstraint.activate([
      buttonContainer.centerXAnchor.constraint(equalTo: circle.centerXAnchor),
      buttonContainer.centerYAnchor.constraint(equalTo: circle.centerYAnchor),
      buttonContainer.heightAnchor.constraint(equalToConstant: circle.frame.height / 2),
      buttonContainer.widthAnchor.constraint(equalToConstant: circle.frame.width / 2)
    ])
  }
}

