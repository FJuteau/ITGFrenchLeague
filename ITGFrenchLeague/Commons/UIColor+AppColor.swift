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
}
