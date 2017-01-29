//
//  StaminaMonthlyRank.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 29/01/2017.
//  Copyright © 2017 Fjuteau. All rights reserved.
//

import Foundation
import RealmSwift

final class StaminaMonthlyRank: MonthlyRank, TabModelProtocol {
  
  convenience required init?(withDictionary dic:[String:String]) {
    
    guard let playerName  = dic["Player"],
      let rankString      = dic["Rank"],
      let rank            = Int(rankString),
      let songTitle       = dic["SongTitle"],
      let songScore       = dic["SongScore"] else { return nil }
    
    self.init()
    self.playerName = playerName
    self.rank       = rank
    self.songTitle  = songTitle
    self.songScore  = songScore
    
    
    DispatchQueue.main.async {
      let realm = try! Realm()
      
      if let monthlyRank = realm.objects(type(of: self)).filter("playerName == \"\(playerName)\"").first {
        
        try! realm.write {
          monthlyRank.playerName = playerName
          monthlyRank.rank       = rank
          monthlyRank.songTitle  = songTitle
          monthlyRank.songScore  = songScore
        }
      } else {
        
        try! realm.write {
          realm.add(self)
        }
      }
    }
    
  }
}
