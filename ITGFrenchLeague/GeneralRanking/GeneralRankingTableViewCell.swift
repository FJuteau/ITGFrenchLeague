//
//  GeneralRankingTableViewCell.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 18/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

class GeneralRankingTableViewCell: UITableViewCell {
  
  @IBOutlet weak var overallRankLabel: UILabel!
  @IBOutlet weak var playerImageView: UIImageView!
  @IBOutlet weak var playerNameLabel: UILabel!
  @IBOutlet weak var speedRankLabel: UILabel!
  @IBOutlet weak var staminaRankLabel: UILabel!
  @IBOutlet weak var timingRankLabel: UILabel!
  
  func configure(with viewModel: GeneralRankingTableViewCellViewModel) {
    
    overallRankLabel.text = viewModel.overallRankingText
    playerNameLabel.text  = viewModel.playerNameText
    speedRankLabel.text   = viewModel.speedRankingText
    staminaRankLabel.text = viewModel.staminaRankingText
    timingRankLabel.text  = viewModel.timingRankingText
  }
}
