//
//  ChallengerTableViewCellViewModel.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 18/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation

struct ChallengerTableViewCellViewModel {
  
  var songBannerUrl : String
  var levelText : String
  var songTitle : String
  var songInfoText : String
  
  init(with song: Song) {
  
    self.songBannerUrl = song.banner
    self.levelText = song.level
    self.songTitle = song.title
    self.songInfoText = "Stepartist : \(song.stepArtist) - Pack : \(song.pack)"
  }
}
