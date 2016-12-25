//
//  GeneralRankingTableViewCell.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 18/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

class GeneralRankingTableViewCell: UITableViewCell {
  
  @IBOutlet weak var backgroundImageView: UIImageView!
  @IBOutlet weak var overallRankLabel: UILabel!
  @IBOutlet weak var playerImageView: UIImageView!
  @IBOutlet weak var playerNameLabel: UILabel!
  @IBOutlet weak var speedRankLabel: UILabel!
  @IBOutlet weak var staminaRankLabel: UILabel!
  @IBOutlet weak var timingRankLabel: UILabel!
  
  override func awakeFromNib() {
    
    let image = UIImage(named: "corner")
    let myInsets : UIEdgeInsets   = UIEdgeInsetsMake(5, 5, 5, 5)
    backgroundImageView.image     = image?.resizableImage(withCapInsets: myInsets, resizingMode: .stretch)
    
    overallRankLabel.font         = UIFont.title(with: 25)
    overallRankLabel.textColor    = UIColor.mainText
    
    playerNameLabel.font          = UIFont.title(with: 25)
    playerNameLabel.textColor     = UIColor.mainText
    
    speedRankLabel.font           = UIFont.main(with: 25)
    speedRankLabel.textColor      = UIColor.mainText
    
    staminaRankLabel.font         = UIFont.main(with: 25)
    staminaRankLabel.textColor    = UIColor.mainText
    
    timingRankLabel.font          = UIFont.main(with: 25)
    timingRankLabel.textColor     = UIColor.mainText
    
    playerImageView.layer.borderColor = UIColor.mainText.cgColor
    playerImageView.layer.borderWidth = 0.5
  }
  
  func configure(with viewModel: GeneralRankingTableViewCellViewModel) {
    
    overallRankLabel.text = viewModel.overallRankingText
    playerNameLabel.text  = viewModel.playerNameText
    speedRankLabel.text   = viewModel.speedRankingText
    staminaRankLabel.text = viewModel.staminaRankingText
    timingRankLabel.text  = viewModel.timingRankingText
    
    let iconURL = URL(string: viewModel.playerImageUrl)
    playerImageView.sd_setImage(with: iconURL, completed: { image, error, cacheType, imageURL in
      
      if let error = error {
        print("URL ERROR : \(error)")
      }
    })
  }
}
