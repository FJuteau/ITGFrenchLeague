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
    
    backgroundColor = UIColor.black
    
    mainView.layer.borderWidth = 0.5
    mainView.layer.borderColor = UIColor.mainText.cgColor
    mainView.backgroundColor = UIColor.black
    
    songTitleLabel.font = UIFont.mainBold(with: 20)
    songTitleLabel.textColor = UIColor.mainText
    
    packLabel.font = UIFont.main(with: 12)
    packLabel.textColor = UIColor.mainText
    
    proposeLabel.font = UIFont.main(with: 17)
    proposeLabel.textColor = UIColor.mainText
    
    proposeNameLabel.font = UIFont.title(with: 20)
    proposeNameLabel.textColor = UIColor.mainText
    
    levelView.layer.borderWidth = 0.5
    levelView.layer.borderColor = UIColor.mainText.cgColor
    
    levelLabel.font = UIFont.main(with: 25)
    levelLabel.textColor = UIColor.mainText
    
    levelTitleLabel.font = UIFont.main(with: 10)
    levelTitleLabel.textColor = UIColor.mainText
    
    confirmationView.layer.borderWidth = 0.5
    confirmationView.layer.borderColor = UIColor.mainText.cgColor
    confirmationView.backgroundColor = UIColor.black
    
    confirmationLabel.font = UIFont.main(with: 15)
    confirmationLabel.textColor = UIColor.mainText
    
    likeCountLabel.font = UIFont.main(with: 12)
    likeCountLabel.textColor = UIColor.gray
    
    likeButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 0)
  }

  func configure(with viewModel: SuggestionsTableViewModel) {
    
    songTitleLabel.text       = viewModel.songTitleText
    packLabel.text            = viewModel.packText
    proposeNameLabel.text     = viewModel.proposePlayerText
    
    levelLabel.text           = viewModel.levelText
    levelView.layer.borderColor = viewModel.levelColor.cgColor
    levelLabel.textColor = viewModel.levelColor
    levelTitleLabel.textColor = viewModel.levelColor
    
    confirmationLabel.text    = viewModel.statusText
    confirmationView.layer.borderColor = viewModel.statusColor.cgColor
    confirmationLabel.textColor = viewModel.statusColor
    
    likeCountLabel.text       = viewModel.likeCountText
  }
}
