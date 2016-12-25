//
//  ChallengeSectionViewCell.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 25/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//
import UIKit

class ChallengeSectionViewCell: UITableViewCell {
  
  @IBOutlet weak var backgroundImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  
  override func awakeFromNib() {
    
    let image = UIImage(named: "corner")
    let myInsets : UIEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)
    backgroundImageView.image = image?.resizableImage(withCapInsets: myInsets, resizingMode: .stretch)
    
    titleLabel.font = UIFont.title(with: 25)
    titleLabel.textColor = UIColor.mainText
  }
}
