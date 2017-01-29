//
//  GlobalRank.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 12/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation

final class GlobalRank: TabModelProtocol {
  
  dynamic var playerName  = ""
  dynamic var rank        = 0
  dynamic var sum         = ""
  
  convenience init?(withDictionary dic:[String:String]) {
    
    guard let playerName  = dic["Player"],
      let rankString      = dic["Overall Rank"],
      let rank            = Int(rankString),
      let sum             = dic["Sum"] else { return nil }
    
    self.init()
    self.playerName = playerName
    self.rank       = rank
    self.sum        = sum
  }
  
}
