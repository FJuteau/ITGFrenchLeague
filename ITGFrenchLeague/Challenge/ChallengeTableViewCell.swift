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
  @IBOutlet weak var levelTitleLabel: UILabel!
  @IBOutlet weak var levelLabel: UILabel!
  @IBOutlet weak var songTitleLabel: UILabel!
  @IBOutlet weak var songInfoLabel: UILabel!
  
  override func awakeFromNib() {
    
    songTitleLabel.font = UIFont.main(with: 25)
    songTitleLabel.textColor = UIColor.mainText
    
    songInfoLabel.font = UIFont.main(with: 15)
    songInfoLabel.textColor = UIColor.mainText
    
    levelTitleLabel.font = UIFont.main(with: 10)
    levelTitleLabel.textColor = UIColor.mainText
    
    levelLabel.font = UIFont.main(with: 25)
    levelLabel.textColor = UIColor.mainText
    
    levelView.layer.borderWidth = 0.5
    levelView.layer.borderColor = UIColor.mainText.cgColor
    
    songBannerImageView.layer.borderWidth = 0.5
    songBannerImageView.layer.borderColor = UIColor.mainText.cgColor
    
  }
  
  func configure(with viewModel: ChallengerTableViewCellViewModel) {
    
    levelLabel.text = viewModel.levelText
    songTitleLabel.text = viewModel.songTitle
    songInfoLabel.text = viewModel.songInfoText
    
    let iconURL = URL(string: viewModel.songBannerUrl)
    songBannerImageView.sd_setImage(with: iconURL, completed: { image, error, cacheType, imageURL in
      
      if let error = error {
        print("URL ERROR : \(error)")
      }
    })
  }
}
