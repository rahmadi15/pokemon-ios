//
//  CardView.swift
//  pokemon-ios
//
//  Created by Rahmad Hidayat on 24/08/21.
//

import UIKit

@IBDesignable
class CardView: UIView {
    @IBInspectable var cornerRadius: CGFloat{
        set {
            layer.cornerRadius = newValue
        }
        get{
            return layer.cornerRadius
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    @IBInspectable var masksToBounds: Bool {
        get {
            return layer.masksToBounds
        }
        set {
            if newValue == true {
                self.layer.masksToBounds = true
            } else {
                self.layer.masksToBounds = false
            }
        }
    }
    
    func isHidden(hide: Bool) {
        self.isHidden = hide
    }
    
    @IBInspectable var dashedBorder: Bool {
        get {
            return layer.masksToBounds
        }
        set {
            if newValue == true {
                let color = UIColor.white.cgColor

                let shapeLayer:CAShapeLayer = CAShapeLayer()
                let frameSize = self.frame.size
                let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

                shapeLayer.bounds = shapeRect
                shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
                shapeLayer.fillColor = UIColor.clear.cgColor
                shapeLayer.strokeColor = color
                shapeLayer.lineWidth = 2
                shapeLayer.lineJoin = CAShapeLayerLineJoin.round
                shapeLayer.lineDashPattern = [6,3]
                shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath

                self.layer.addSublayer(shapeLayer)
            }
        }
    }
}

