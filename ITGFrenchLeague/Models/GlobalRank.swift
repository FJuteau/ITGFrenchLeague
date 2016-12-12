//
//  GlobalRank.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 12/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation

struct GlobalRank: TabModelProtocol {
  
  var playerName: String
  var rank: Int
  var sum: String
  
  init?(withDictionary dic:[String:String]) {
    
    guard let playerName  = dic["Player"],
      let rankString      = dic["Overall Rank"],
      let rank            = Int(rankString),
      let sum             = dic["Sum"] else { return nil }
    
    self.playerName = playerName
    self.rank       = rank
    self.sum        = sum
  }
  
}
