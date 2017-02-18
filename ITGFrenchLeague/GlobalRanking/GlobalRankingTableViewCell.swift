//
//  GlobalRankingTableViewCell.swift
//  ITGFrenchLeague
//
//  Created by Francois JUTEAU on 29/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

class GlobalRankingTableViewCell: UITableViewCell {
  
  @IBOutlet weak var backgroundImageView: UIImageView!
  @IBOutlet weak var rankLabel: UILabel!
  @IBOutlet weak var playerImageView: UIImageView!
  @IBOutlet weak var playerNameLabel: UILabel!
  @IBOutlet weak var sumLabel: UILabel!
  
  override func awakeFromNib() {
    
    let image = UIImage(named: "corner")
    let myInsets : UIEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)
    backgroundImageView.image   = image?.resizableImage(withCapInsets: myInsets, resizingMode: .stretch)
    
    rankLabel.font            = UIFont.title(with: 25)
    rankLabel.textColor       = UIColor.mainText
    
    playerNameLabel.font      = UIFont.title(with: 25)
    playerNameLabel.textColor = UIColor.mainText
    
    sumLabel.font             = UIFont.main(with: 25)
    sumLabel.textColor        = UIColor.mainText
    
    playerImageView.layer.borderColor = UIColor.mainText.cgColor
    playerImageView.layer.borderWidth = 0.5
  }
  
  func configure(with viewModel: GlobalRankingTableViewModel) {
    
    rankLabel.text        = viewModel.rankText
    playerNameLabel.text  = viewModel.playerNameText
    sumLabel.text         = viewModel.sumText
    
    rankLabel.textColor       = viewModel.rankColor
    playerNameLabel.textColor = viewModel.rankColor
    playerImageView.layer.borderColor = viewModel.rankColor.cgColor
    
    let iconURL = URL(string: viewModel.playerImageUrl)
    playerImageView.sd_setImage(with: iconURL, completed: { image, error, cacheType, imageURL in
      
      if let error = error {
        print("URL ERROR : \(error)")
      }
    })
  }
}
