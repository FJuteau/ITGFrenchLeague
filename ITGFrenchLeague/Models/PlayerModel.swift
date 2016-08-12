//
//  PlayerModel.swift
//  ITGFrenchLeague
//
//  Created by francois on 10/08/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation

class PlayerModel: TabModelProtocol
{
  var age: String
  var description: String
  var name: String
  var photo: String
  
  required init(withDictionary dic:[String:String]) {
    age = dic["Age"]!
    description = dic["Description"]!
    name = dic["Name"]!
    photo = dic["Photo"]!
  }
  
}