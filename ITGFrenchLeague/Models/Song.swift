//
//  SongInfoModel.swift
//  ITGFrenchLeague
//
//  Created by francois on 12/08/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation

struct Song: TabModelProtocol {
  
  var type        : SongType
  var title       : String
  var pack        : String
  var banner      : String
  var stepArtist  : String
  var level       : String
  
  init?(withDictionary dic:[String:String]) {
    
    guard let typeString  = dic["type"],
      let type            = SongTypeTool.songType(for: typeString),
      let title           = dic["title"],
      let pack            = dic["pack"],
      let banner          = dic["banner"],
      let stepArtist      = dic["stepArtist"],
      let level           = dic["level"] else { return nil }
    
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


enum SongType {
  
  case speed
  case stamina
  case timing
  case unkown
  
  static func songType(forSection section: Int) -> SongType {
    
    switch section {
    case 0:
      return speed
      
    case 1:
      return stamina
    
    case 2:
      return timing
      
    default:
      return unkown
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
      
    case .unkown:
      return "unkown"
    }
  }
}
