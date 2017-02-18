//
//  GlobalRankingTableViewModel.swift
//  ITGFrenchLeague
//
//  Created by Francois JUTEAU on 29/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

struct GlobalRankingTableViewModel {
  
  var rankText: String
  var playerImageUrl: String
  var playerNameText: String
  var sumText: String
  var rankColor: UIColor
  
  init(with globalRank: GlobalRank) {
    
    rankText = "\(globalRank.rank)."
    playerNameText = globalRank.playerName
    sumText = globalRank.sum
    rankColor = UIColor.ranking(for: globalRank.rank)
    
    if let player = DataRetainer.player(forName: playerNameText) {
      
      playerImageUrl = player.photo
    } else {
      playerImageUrl = ""
    }
  }
}
