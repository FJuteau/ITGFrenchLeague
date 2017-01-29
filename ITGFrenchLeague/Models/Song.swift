//
//  SongInfoModel.swift
//  ITGFrenchLeague
//
//  Created by francois on 12/08/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation
import RealmSwift

final class Song: Object, TabModelProtocol {
  
  dynamic var type        = SongType.unknown
  dynamic var title       = ""
  dynamic var pack        = ""
  dynamic var banner      = ""
  dynamic var stepArtist  = ""
  dynamic var level       = ""
  
  convenience init?(withDictionary dic:[String:String]) {
    
    guard let typeString  = dic["type"],
      let type            = SongTypeTool.songType(for: typeString),
      let title           = dic["title"],
      let pack            = dic["pack"],
      let banner          = dic["banner"],
      let stepArtist      = dic["stepArtist"],
      let level           = dic["level"] else { return nil }
    
    self.init()
    self.type = type
    self.title = title
    self.pack = pack
    self.banner = banner
    self.stepArtist =  stepArtist
    self.level = level
  }

}

struct SongTypeTool {
  
  static func songType(for string: String) -> SongType? {
    
    if string == "Stamina" {
      return .stamina
    }
    else if string == "Speed" {
      return .speed
    }
    else if string == "Timing" {
      return .timing
    }
    return nil
  }
}


@objc enum SongType: Int {
  
  case speed
  case stamina
  case timing
  case unknown
  
  static func songType(forSection section: Int) -> SongType {
    
    switch section {
    case 0:
      return speed
      
    case 1:
      return stamina
    
    case 2:
      return timing
      
    default:
      return unknown
    }
  }
  
  func typeSection() -> Int {
    
    switch self {
    case .speed:
      return 0
      
    case .stamina:
      return 1
      
    case .timing:
      return 2
      
    case .unknown:
      return 3
    }
  }
  
  func typeTitle() -> String {
    
    switch self {
    case .speed:
      return "Speed"
      
    case .stamina:
      return "Stamina"
      
    case .timing:
      return "Timing"
      
    case .unknown:
      return "unkown"
    }
  }
}
