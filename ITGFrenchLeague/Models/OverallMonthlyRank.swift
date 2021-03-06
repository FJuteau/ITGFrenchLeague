//
//  OverallMonthlyRank.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 12/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation
import RealmSwift

final class OverallMonthlyRank: Object, TabModelProtocol {
  
  dynamic var playerName  = ""
  dynamic var rank        = 0
  dynamic var speedRank   = 0
  dynamic var staminaRank = 0
  dynamic var timingRank  = 0
  
  
  convenience init?(withDictionary dic:[String:String]) {
    
    guard let playerName        = dic["Player"],
      let rankString            = dic["Overall Rank"],
      let rank                  = Int(rankString),
      let speedRankString       = dic["Speed Rank"],
      let speedRank             = Int(speedRankString),
      let staminaRankString     = dic["Stamina Rank"],
      let staminaRank           = Int(staminaRankString),
      let timingRankString      = dic["Timing Rank"],
      let timingRank            = Int(timingRankString) else { return nil }
    
    self.init()
    self.playerName   = playerName
    self.rank         = rank
    self.speedRank    = speedRank
    self.staminaRank  = staminaRank
    self.timingRank   = timingRank
    
    
    DispatchQueue.main.async {
      let realm = try! Realm()
      
      if let overallMonthlyRank = realm.objects(OverallMonthlyRank.self).filter("playerName == \"\(playerName)\"").first {
        
        try! realm.write {
          overallMonthlyRank.playerName   = playerName
          overallMonthlyRank.rank         = rank
          overallMonthlyRank.speedRank    = speedRank
          overallMonthlyRank.staminaRank  = staminaRank
          overallMonthlyRank.timingRank   = timingRank
        }
      } else {
        
        try! realm.write {
          realm.add(self)
        }
      }
    }
    
  }
  
}
