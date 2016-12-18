//
//  MonthlyRank.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 12/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation

struct MonthlyRank: TabModelProtocol {
  
  var playerName  : String
  var rank        : Int
  var songTitle   : String
  var songScore   : String
  
  
  init?(withDictionary dic:[String:String]) {
    
    guard let playerName  = dic["Player"],
      let rankString      = dic["Rank"],
      let rank            = Int(rankString),
      let songTitle       = dic["SongTitle"],
      let songScore       = dic["SongScore"] else { return nil }
    
    self.playerName = playerName
    self.rank       = rank
    self.songTitle  = songTitle
    self.songScore  = songScore
  }
  
}
