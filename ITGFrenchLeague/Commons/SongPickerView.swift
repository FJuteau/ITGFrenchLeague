//
//  SongPickerView.swift
//  ITGFrenchLeague
//
//  Created by Francois JUTEAU on 30/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

class SongPickerView: UIView {

  var backgroundImageView: UIImageView
  
  var pickerView: UIPickerView
  
  var submitButton: UIButton
  
  override init(frame: CGRect) {
    
    // init
    backgroundImageView = UIImageView(frame: frame)
    pickerView = UIPickerView(frame: frame)
    submitButton = UIButton(type: .system)
    
    // configure
    var image = UIImage(named: "corner")
    let myInsets : UIEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)
    image = image?.resizableImage(withCapInsets: myInsets, resizingMode: .stretch)
    backgroundImageView.image = image
    
    let attributes = [NSForegroundColorAttributeName: UIColor.mainText,
                      NSFontAttributeName: UIFont.main(with: 20)] as [String : Any]
    submitButton.setAttributedTitle(NSAttributedString(string: "OK", attributes: attributes), for: .normal)
//    submitButton.setTitleColor(UIColor.mainText, for: .normal)
//    submitButton.setTitle("OK", for: .normal)
    
    super.init(frame: frame)
    
    //layout
    let viewsFrame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
    backgroundImageView.frame = viewsFrame
    pickerView.frame = viewsFrame
    
    let submitButtonWidth: CGFloat = 50
    submitButton.frame = CGRect(x: self.frame.width - submitButtonWidth, y: 0, width: submitButtonWidth, height: 50)
    
    // adding
    self.addSubview(backgroundImageView)
    self.addSubview(pickerView)
    self.addSubview(submitButton)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
