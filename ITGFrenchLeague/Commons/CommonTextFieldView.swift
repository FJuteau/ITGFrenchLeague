//
//  CommonTextFieldView.swift
//  ITGFrenchLeague
//
//  Created by Francois JUTEAU on 30/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

class CommonTextFieldView: UIView {
  
  @IBOutlet var view: UIView!
  
  @IBOutlet weak var backgroundImageView: UIImageView!
  @IBOutlet weak var textField: UITextField!
  
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    Bundle.main.loadNibNamed("CommonTextFieldView", owner: self, options: nil)
    self.addSubview(view)
    view.frame = self.bounds
  }
  
  
  override func awakeFromNib() {
    
    self.backgroundColor = UIColor.clear
    view.backgroundColor = UIColor.clear

    var image = UIImage(named: "corner")
    let myInsets : UIEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)
    image = image?.resizableImage(withCapInsets: myInsets, resizingMode: .stretch)
    
    backgroundImageView.image = image
    
    let attributes = [NSForegroundColorAttributeName: UIColor.mainText,
                      NSFontAttributeName: UIFont.main(with: 20)] as [String : Any]
    textField.attributedPlaceholder = NSAttributedString(string: "< Taper ici... >", attributes: attributes)
    textField.textColor = UIColor.mainText
    textField.font = UIFont.main(with: 20)
    textField.backgroundColor = UIColor.clear
  }
  
  
}
