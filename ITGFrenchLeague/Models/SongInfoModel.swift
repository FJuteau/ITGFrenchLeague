//
//  SongInfoModel.swift
//  ITGFrenchLeague
//
//  Created by francois on 12/08/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation

struct SongInfoModel: TabModelProtocol {
  
  var title: String
  var pack: String
  var banner: String
  var stepArtist: String
  
  init?(withDictionary dic:[String:String]) {
    
    guard let title   = dic["title"],
      let pack        = dic["pack"],
      let banner      = dic["banner"],
      let stepArtist  = dic["stepArtist"] else { return nil }
    
    self.title = title
    self.pack = pack
    self.banner = banner
    self.stepArtist =  stepArtist
  }
  
}
