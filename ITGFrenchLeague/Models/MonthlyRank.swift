//
//  MonthlyRank.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 12/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation
import RealmSwift

final class MonthlyRank: Object, TabModelProtocol {
  
  dynamic var playerName  = ""
  dynamic var rank        = 0
  dynamic var songTitle   = ""
  dynamic var songScore   = ""
  
  
  convenience init?(withDictionary dic:[String:String]) {
    
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
      
      if let monthlyRank = realm.objects(MonthlyRank.self).filter("playerName == \"\(playerName)\"").first {
        
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
