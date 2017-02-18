//
//  UIColor+AppColor.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 23/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

extension UIColor {
  
  static var mainText: UIColor {
    
    return UIColor(colorLiteralRed: 227/255, green: 170/255, blue: 21/255, alpha: 1)
  }
  
  static var mainColor: UIColor {
    
    return UIColor(colorLiteralRed: 43/255, green: 1/255, blue: 96/255, alpha: 1)
  }
  
  // MARK: - One Pixel Image
  
  func as1ptImage() -> UIImage {
    UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
    let ctx = UIGraphicsGetCurrentContext()
    self.setFill()
    ctx!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
  }
  
  static func ranking(for rank: Int) -> UIColor {
    
    switch rank {
    case 1:
      return yellow
    case 2:
      return white
    case 3:
      return orange
    default:
      return mainText
    }
  }
  
  static func status(for status: String) -> UIColor {
    
    switch status {
    case SuggestionStatus.invalidSuggestionStatus.rawValue:
      return red
    case SuggestionStatus.validSuggestionStatus.rawValue:
      return green
    case SuggestionStatus.waitingSuggestionStatus.rawValue:
      return mainText
    default:
      return mainText
    }
  }
  
  static func level(for level: Int) -> UIColor {
    
    if level < 12 {
      return mainText
    } else if level < 15 {
      return red
    } else {
      return blue
    }
  }
}
