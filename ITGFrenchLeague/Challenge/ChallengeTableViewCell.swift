//
//  ChallengeTableViewCell.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 14/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation
import UIKit

class ChallengeTableViewCell: UITableViewCell {
  
  @IBOutlet weak var songBannerImageView: UIImageView!
  @IBOutlet weak var levelView: UIView!
  @IBOutlet weak var levelLabel: UILabel!
  @IBOutlet weak var songTitleLabel: UILabel!
  @IBOutlet weak var songInfoLabel: UILabel!
  
  func configure(with viewModel: ChallengerTableViewCellViewModel) {
    
    levelLabel.text = viewModel.levelText
    songTitleLabel.text = viewModel.songTitle
    songInfoLabel.text = viewModel.songInfoText
  }
}
