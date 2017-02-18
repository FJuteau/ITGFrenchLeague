//
//  ChallengerTableViewCellViewModel.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 18/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

struct ChallengerTableViewCellViewModel {
  
  var songBannerUrl : String
  var levelText : String
  var levelColor : UIColor
  var songTitle : String
  var songInfoText : String
  
  init(with song: Song) {
  
    songBannerUrl = song.banner
    levelText = song.level
    if let level = Int(levelText) {
      levelColor = UIColor.level(for: level)
    } else {
      levelColor = UIColor.mainText
    }
    
    songTitle = song.title
    songInfoText = "Stepartist : \(song.stepArtist) - Pack : \(song.pack)"
  }
}
