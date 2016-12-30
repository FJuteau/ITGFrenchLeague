//
//  SendScoreView.swift
//  ITGFrenchLeague
//
//  Created by Francois JUTEAU on 30/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

class SendScoreView: UIView {
  
  typealias Const = SendScoreViewConstants
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
    
    titleLabel.textColor      = Const.labelTextColor
    titleLabel.font           = Const.titleFont
    
    pseudoLabel.textColor     = Const.labelTextColor
    pseudoLabel.font          = Const.labelFont
    
    submitSongLabel.textColor = Const.labelTextColor
    submitSongLabel.font      = Const.labelFont
    
    scoreLabel.textColor      = Const.labelTextColor
    scoreLabel.font           = Const.labelFont
    
    screenshotLabel.textColor = Const.labelTextColor
    screenshotLabel.font      = Const.labelFont
    
    submitButton.isEnabled = false
    
    playerNameTextFieldView.textField.tag = Const.playerNameTextFieldViewTag
    scoreTextFieldView.textField.tag      = Const.scoreTextFieldViewTag
  }
}

struct SendScoreViewConstants {
  
  static let labelTextColor = UIColor.mainText
  static let labelFont = UIFont.main(with: 20)
  
  static let titleFont = UIFont.mainBold(with: 25)
  
  static let playerNameTextFieldViewTag = 0
  static let scoreTextFieldViewTag = 1
}
