//
//  SuggestionsTableViewCell.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 31/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

class SuggestionsTableViewCell: UITableViewCell {

  @IBOutlet weak var mainView: UIView!
  @IBOutlet weak var songTitleLabel: UILabel!
  @IBOutlet weak var packLabel: UILabel!
  @IBOutlet weak var proposeLabel: UILabel!
  @IBOutlet weak var proposeNameLabel: UILabel!
  
  @IBOutlet weak var levelView: UIView!
  @IBOutlet weak var levelTitleLabel: UILabel!
  @IBOutlet weak var levelLabel: UILabel!
  
  @IBOutlet weak var confirmationView: UIView!
  @IBOutlet weak var confirmationLabel: UILabel!
  
  @IBOutlet weak var likeButton: UIButton!
  @IBOutlet weak var likeCountLabel: UILabel!
  
  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
  }

  func configure(with viewModel: SuggestionsTableViewModel) {
    
    songTitleLabel.text        = viewModel.songTitleText
    packLabel.text  = viewModel.packText
    proposeNameLabel.text         = viewModel.proposePlayerText
    
    levelLabel.text = viewModel.levelText
    
    confirmationLabel.text = viewModel.statusText
    
    likeCountLabel.text = viewModel.likeCountText
  }
}
