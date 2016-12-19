//
//  RankingTableViewCell.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 18/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

class RankingTableViewCell: UITableViewCell {
  
  @IBOutlet weak var rankLabel: UILabel!
  @IBOutlet weak var playerImageView: UIImageView!
  @IBOutlet weak var playerNameLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  
  func configure(with viewModel: RankingTableViewModel) {
    
    rankLabel.text        = viewModel.rankText
    playerNameLabel.text  = viewModel.playerNameText
    scoreLabel.text       = viewModel.scoreText
  }
}
