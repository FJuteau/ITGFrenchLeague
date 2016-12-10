//
//  PlayerModel.swift
//  ITGFrenchLeague
//
//  Created by francois on 10/08/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation

struct PlayerModel: TabModelProtocol {
  
  var since: String
  var description: String
  var name: String
  var photo: String
  
  init?(withDictionary dic:[String:String]) {
    
    guard let since     = dic["Since"],
      let description = dic["Description"],
      let name        = dic["Name"],
      let photo       = dic["Photo"] else { return nil }
    
    self.since        = since
    self.description  = description
    self.name         = name
    self.photo        =  photo
  }
  
}
