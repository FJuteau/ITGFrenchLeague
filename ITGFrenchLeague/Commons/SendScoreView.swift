//
//  SendScoreView.swift
//  ITGFrenchLeague
//
//  Created by Francois JUTEAU on 30/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

class SendScoreView: UIView {
  
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBOutlet weak var pseudoLabel: UILabel!
  @IBOutlet weak var playerNameTextFieldView: CommonTextFieldView!
  
  @IBOutlet weak var submitSongLabel: UILabel!
  @IBOutlet weak var submitSongButton: MenuButton!
  
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var scoreTextFieldView: CommonTextFieldView!
  
  @IBOutlet weak var screenshotLabel: UILabel!
  @IBOutlet weak var screenshotButton: MenuButton!
  
  @IBOutlet weak var submitButton: MenuButton!
  
  override func awakeFromNib() {
    
    titleLabel.textColor      = Constants.labelTextColor
    titleLabel.font           = Constants.titleFont
    
    pseudoLabel.textColor     = Constants.labelTextColor
    pseudoLabel.font          = Constants.labelFont
    
    submitSongLabel.textColor = Constants.labelTextColor
    submitSongLabel.font      = Constants.labelFont
    
    scoreLabel.textColor      = Constants.labelTextColor
    scoreLabel.font           = Constants.labelFont
    
    screenshotLabel.textColor = Constants.labelTextColor
    screenshotLabel.font      = Constants.labelFont
    
    submitButton.isEnabled = false
  }
}

struct Constants {
  
  static let labelTextColor = UIColor.mainText
  static let labelFont = UIFont.main(with: 20)
  
  static let titleFont = UIFont.mainBold(with: 25)
}
