//
//  MenuButton.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 23/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

class MenuButton: UIButton {
  
  override func awakeFromNib() {
    
    var image = UIImage(named: "corner")
    let myInsets : UIEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)
    image = image?.resizableImage(withCapInsets: myInsets, resizingMode: .stretch)
    setBackgroundImage(image, for: .normal)
    
    setTitleColor(UIColor.mainText, for: .normal)
    titleLabel?.font = UIFont.main(with: 20)
  }
}
