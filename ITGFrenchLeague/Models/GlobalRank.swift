//
//  GlobalRank.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 12/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation
import RealmSwift

final class GlobalRank: Object, TabModelProtocol {
  
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
    
    
    DispatchQueue.main.async {
      let realm = try! Realm()
      
      if let globalRank = realm.objects(GlobalRank.self).filter("playerName == \"\(playerName)\"").first {
        
        try! realm.write {
          globalRank.playerName = playerName
          globalRank.rank       = rank
          globalRank.sum        = sum
        }
      } else {
        
        try! realm.write {
          realm.add(self)
        }
      }
    }
    
  }
  
}
