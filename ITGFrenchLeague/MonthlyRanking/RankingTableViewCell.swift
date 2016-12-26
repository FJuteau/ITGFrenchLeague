//
//  RankingTableViewCell.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 18/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

class RankingTableViewCell: UITableViewCell {
  
  @IBOutlet weak var backgroundImageView: UIImageView!
  @IBOutlet weak var rankLabel: UILabel!
  @IBOutlet weak var playerImageView: UIImageView!
  @IBOutlet weak var playerNameLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  
  override func awakeFromNib() {
    
    let image = UIImage(named: "corner")
    let myInsets : UIEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)
    backgroundImageView.image   = image?.resizableImage(withCapInsets: myInsets, resizingMode: .stretch)
    
    rankLabel.font            = UIFont.title(with: 25)
    rankLabel.textColor       = UIColor.mainText
    
    playerNameLabel.font      = UIFont.title(with: 25)
    playerNameLabel.textColor = UIColor.mainText
    
    scoreLabel.font           = UIFont.main(with: 25)
    scoreLabel.textColor      = UIColor.mainText
    
    playerImageView.layer.borderColor = UIColor.mainText.cgColor
    playerImageView.layer.borderWidth = 0.5
  }
  
  func configure(with viewModel: RankingTableViewModel) {
    
    rankLabel.text        = viewModel.rankText
    playerNameLabel.text  = viewModel.playerNameText
    scoreLabel.text       = viewModel.scoreText
  }
}
