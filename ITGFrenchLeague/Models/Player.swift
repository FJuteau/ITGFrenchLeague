//
//  PlayerModel.swift
//  ITGFrenchLeague
//
//  Created by francois on 10/08/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation
import RealmSwift

final class Player: Object, TabModelProtocol {
  
  dynamic var since = ""
  dynamic var information = ""
  dynamic var name = ""
  dynamic var photo = ""
  
  convenience init?(withDictionary dic:[String:String]) {
    
    
    guard let since   = dic["Since"],
      let information = dic["Description"],
      let name        = dic["Name"],
      let photo       = dic["Photo"] else { return nil }
    
    self.init()
    self.since        = since
    self.information  = information
    self.name         = name
    self.photo        = photo
    
    
    DispatchQueue.main.async {
      let realm = try! Realm()
      
      if let player = realm.objects(Player.self).filter("name == \"\(name)\"").first {
        
        try! realm.write {
          player.since        = since
          player.information  = information
          player.name         = name
          player.photo        = photo
        }
      } else {
        
        try! realm.write {
          realm.add(self)
        }
      }
    }

    
  }
  
}
