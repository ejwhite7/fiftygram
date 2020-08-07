//
//  filterButton.swift
//  Fiftygram
//
//  Created by Edward White on 7/12/20.
//

import UIKit

@IBDesignable
class filterButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0{
            didSet{
            self.layer.cornerRadius = cornerRadius
            }
        }

    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
            }
        }

        @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
            }
        }
        @IBInspectable var shadowColor: UIColor = UIColor.clear{
        didSet{
            self.layer.shadowColor = shadowColor.cgColor
            }
        }
        @IBInspectable var shadowOpacity: CGFloat = 0.0 {
            didSet{
                self.layer.shadowOpacity = Float(shadowOpacity)
                }
            }
        @IBInspectable var shadowRadius: CGFloat = 0.0 {
            didSet{
                self.layer.shadowRadius = shadowRadius
                }
            }
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor(red: 0.86, green: 0.87, blue: 0.85, alpha: 1.00) : UIColor.white
            layer.shadowOffset = isHighlighted ? CGSize(width: 0.0, height: 0.0) : CGSize(width: 0.0, height: 2.0)
            
        }
    }
}
