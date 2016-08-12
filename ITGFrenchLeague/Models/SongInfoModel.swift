//
//  SongInfoModel.swift
//  ITGFrenchLeague
//
//  Created by francois on 12/08/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation

class SongInfoModel: TabModelProtocol
{
  var title: String
  var pack: String
  var banner: String
  var stepArtist: String
  
  required init(withDictionary dic:[String:String]) {
    title = ""
    pack = ""
    banner = ""
    stepArtist = ""
  }
  
}