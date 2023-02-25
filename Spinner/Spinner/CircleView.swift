//
//  CircleView.swift
//  Spinner
//
//  Created by Logan Melton on 1/22/23.
//

import UIKit

class CircleView: UIView {
  var goButton: UIButton!
  private var data: [(String, CGFloat)] = []
  var array = [String]()
  var context:  CGContext?
  var colors: [UIColor] = [UIColor.gray]
  var strokeWidth: CGFloat = 0
  var borderColor = UIColor.black
  
  init(frame: CGRect,
       colors: [UIColor]? = nil,
       strokeWidth: CGFloat = 0,
       borderColor: UIColor = .black) {
    super.init(frame: frame)
    self.colors = colors ?? self.colors
    self.strokeWidth = strokeWidth
    self.borderColor = borderColor
    backgroundColor = .clear
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func draw(_ rect: CGRect) {
    guard let context = UIGraphicsGetCurrentContext() else { return }
    
    let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
    
    let radius = min(rect.width / 2, rect.height / 2) - (strokeWidth / 2)
    
    var accumulatedAngle: CGFloat = CGFloat.pi / -2.0
    var i: Int = 0
    
    borderColor.setStroke()
    context.setLineWidth(strokeWidth)
    
    // Building and adding the slices
    data.forEach { (key, value) in
      let angle = value * 2.0 * CGFloat.pi
      
      // Setting up the path to draw
      let path = CGMutablePath()
      path.move(to: CGPoint())
      path.addLine(to: CGPoint(x: radius, y: 0))
      path.addRelativeArc(center: CGPoint(), radius: radius, startAngle: 0, delta: angle)
      path.closeSubpath()
      
      // Setting up the text to draw
      let string = key.capitalized
      let color = UIColor.label.cgColor
      var fontSize: CGFloat = 0
      switch data.count {
        case 1 ... 12:
          fontSize = 36
        case 13 ... 24:
          fontSize = 32
        case 25 ... 36:
          fontSize = 28
        case 37 ... 48:
          fontSize = 24
        default:
          break
      }
      
      let fontName = "Helvetica" as CFString
      let font = CTFontCreateWithName(fontName, fontSize, .none)
      let attributes: [NSMutableAttributedString.Key : Any] = [.font: font, .foregroundColor: color]
      let attributedString = NSAttributedString(string: string,
                                                attributes: attributes)
      let line = CTLineCreateWithAttributedString(attributedString)
      let textSize = CGSize(width: attributedString.size().width, height: attributedString.size().height)
      let mirrorText = CGAffineTransform(scaleX: 1.0, y: -1.0).inverted()
      context.textPosition = CGPoint(x: path.boundingBox.maxX - (textSize.width + fontSize),
                                     y: path.currentPoint.y - fontSize)

      
      
      context.saveGState()
      
      if i >= colors.count { i = 0 }
      context.translateBy(x: center.x, y: center.y)
      context.rotate(by: accumulatedAngle)
      context.addPath(path) // creates slices
      colors[i].setFill() // sets colors to those slices
      context.fillPath() // files slices with colors
      CTLineDraw(line, context) // add the text to the slice
      context.addPath(path) // layers the outlines back onto the slices
      context.strokePath()
      context.restoreGState()
      context.textMatrix = mirrorText.inverted()
      
      accumulatedAngle += angle
      i = i >= colors.count ? 0 : i + 1
    }
  }
  
  func set(data: [String:Float]) {
    let sorted = data.sorted(by: <)
    let sum = sorted.compactMap{ $0.value }.reduce(0, +)
    self.data = sum == 0 ? data.map{ ($0.0, CGFloat($0.1)) } : data.map{ ($0.0, CGFloat($0.1 / sum)) }.sorted(by: { $0.1 > $1.1 })
    array += (data.keys)
  }
  
}

//let backgrounds: [CGColor] = [UIColor.black.cgColor, UIColor.systemOrange.cgColor, UIColor.systemYellow.cgColor, UIColor.systemGreen.cgColor, UIColor.systemCyan.cgColor, UIColor.systemIndigo.cgColor]
