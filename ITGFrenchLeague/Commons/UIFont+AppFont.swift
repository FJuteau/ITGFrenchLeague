//
//  UIFont+AppFont.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 23/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

extension UIFont {
  
  static func main(with size: CGFloat) -> UIFont {
    
    if let font = UIFont(name: "LinLibertine", size: size) {
      return font
    }
    print("Main Font can't load")
    return UIFont.boldSystemFont(ofSize: size)
  }
  
  static func mainBold(with size: CGFloat) -> UIFont {
    
    if let font = UIFont(name: "LinLibertineB", size: size) {
      return font
    }
    print("Main Bold Font can't load")
    return UIFont.boldSystemFont(ofSize: size)
  }
  
  static func title(with size: CGFloat) -> UIFont {
    
    if let font = UIFont(name: "buchanan", size: size) {
      return font
    }
    print("Main Font can't load")
    return UIFont.boldSystemFont(ofSize: size)
  }
}
