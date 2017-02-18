//
//  RankingTableViewModel.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 18/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

struct RankingTableViewModel {
  
  var rankText: String
  var playerImageUrl: String
  var playerNameText: String
  var scoreText: String
  var rankColor: UIColor
  
  init(with monthlyRank: MonthlyRank) {
    
    rankText = "\(monthlyRank.rank)."
    playerNameText = monthlyRank.playerName
    let songScore = String(Float(monthlyRank.songScore)! * 100)
    scoreText = "\(songScore) %"
    rankColor = UIColor.ranking(for: monthlyRank.rank)
    
    if let player = DataRetainer.player(forName: playerNameText) {
      
      playerImageUrl = player.photo
    } else {
      playerImageUrl = ""
    }
  }
}
