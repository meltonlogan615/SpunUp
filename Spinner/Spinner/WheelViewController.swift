//
//  WheelViewController.swift
//  SpwheelView.inner
//
//  Created by Logan Melton on 1/26/23.
//

import UIKit

class WheelViewController: UIViewController {
  var wheelView: WheelView!
  var animation: WheelAnimation!
  var wheelVM = WheelViewModel()
  
  var selectionView: SelectedView!
  var selectionViewModel: SelectedViewModel!
  
  var diameter: CGFloat = 0
  let data = TestData()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    animation = WheelAnimation()
    selectionViewModel = SelectedViewModel()
    selectionViewModel.host = self
    showWheel()
  }

  func showWheel() {
    if view.frame.height < view.frame.width {
      diameter = view.frame.height
    } else {
      diameter = view.frame.width
    }
    
    var slices = [Slice]()
    for i in 0 ..< data.dataTwo.count {
      let slice = Slice.init(name: data.dataTwo[i])
      let label = UILabel(frame: CGRect(x: 0, y: 0, width: diameter / 8, height: diameter / CGFloat(data.dataTwo.count) ))
      label.text = data.dataTwo[i]
      label.textAlignment = .center
      label.textColor = UIColor.label
      let image = UIImage.imageWithLabel(label: label)
      slice.image = image
      slice.color = .random()
      slices.append(slice)
    }

    wheelView = WheelView(center: CGPoint(x: view.frame.width / 2,
                                          y: view.frame.height / 2),
                          diameter: diameter,
                          slices: slices)
    wheelView.delegate = self
    view.addSubview(wheelView)
  }
}

extension WheelViewController: WheelDelegate {
  func shouldSelectObject() -> Int? {
    return Int.random(in: 0 ..< data.dataTwo.count)
  }
  
  func finishedSelecting(index: Int?, error: WheelError?) {
    guard let error = error else { return }
    print("WVC 64: Error == nil")
    print(error)
  }
}


