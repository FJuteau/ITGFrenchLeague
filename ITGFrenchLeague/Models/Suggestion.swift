//
//  Suggestion.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 31/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation
import RealmSwift

final class Suggestion: Object, TabModelProtocol {
  
  dynamic var playerName  = ""
  dynamic var songTitle   = ""
  dynamic var pack        = ""
  dynamic var type        = SongType.unknown
  dynamic var level       = ""
  dynamic var vote        = ""
  dynamic var status      = ""
  
  convenience init?(withDictionary dic:[String:String]) {
    
    guard let playerName  = dic["Player"],
      let songTitle       = dic["Song"],
      let pack            = dic["Pack"],
      let typeString      = dic["Type"],
      let type            = SongTypeTool.songType(for: typeString),
      let level           = dic["Level"],
      let vote            = dic["Vote"],
      let status          = dic["Status"] else { return nil }
    
    self.init()
    self.playerName = playerName
    self.songTitle  = songTitle
    self.pack       = pack
    self.type       = type
    self.level      = level
    self.vote       = vote
    self.status     = status
  }
  
}
