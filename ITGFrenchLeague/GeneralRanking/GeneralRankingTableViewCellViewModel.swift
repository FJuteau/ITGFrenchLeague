//
//  GeneralRankingTableViewCellViewModel.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 18/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation

struct GeneralRankingTableViewCellViewModel {
  
  var overallRankingText: String
  var playerImageUrl: String
  var playerNameText: String
  var speedRankingText: String
  var staminaRankingText: String
  var timingRankingText: String
  
  init(with overallRank: OverallMonthlyRank) {
    
    overallRankingText = "\(overallRank.rank)."
    playerNameText     = overallRank.playerName
    speedRankingText   = String(overallRank.speedRank)
    staminaRankingText = String(overallRank.staminaRank)
    timingRankingText  = String(overallRank.timingRank)
    
    if let player = DataRetainer.player(forName: playerNameText) {
      
      playerImageUrl = player.photo
    } else {
      playerImageUrl = ""
    }
  }
}
