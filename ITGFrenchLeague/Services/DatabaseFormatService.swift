//
//  DatabaseFormatService.swift
//  ITGFrenchLeague
//
//  Created by francois on 16/08/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

/**
 ** !!!!!!!!!!!!!!! SPOILER : Everything in this class is really bad architecture wise !!!!!!!!!!!!!!
 **
 ** This class is relative to the Database
 ** Since the source database is a mess, we have to format every odd behaviour to make it JSON DATABASE complient
 */

import Foundation

class DatabaseFormatService {
  
  static func formattedJSONResponse(entryArray: Array<[String:String]>, tabType: String) -> Array<[String:String]> {
    
    switch tabType {
    case DatabaseURLConstants.playersTabNameValue:
      return entryArray
      
    case DatabaseURLConstants.songInfoTabNameValue:
      return songInfoFormattedArray(array: entryArray)
      
    case DatabaseURLConstants.generalRankTabNameValue:
      return entryArray
      
    case DatabaseURLConstants.monthlyRankTabNameValue:
      return entryArray
      
    default:
      return entryArray
    }
  }
  

  // MARK: - Song Info
  
  static func songInfoFormattedArray(array: Array<[String:String]>) -> Array<[String:String]> {
    var formattedArray = Array<[String:String]>()
    var index = 0
    let columnArray = onlyRankColumnArray(JSONArray: array)
    while index != columnArray.count {
      var formattedDictionary = [String:String]()
      
      formattedDictionary["title"]      = columnArray[index]
      formattedDictionary["pack"]       = columnArray[index+1]
      formattedDictionary["banner"]     = columnArray[index+2]
      formattedDictionary["stepArtist"] = columnArray[index+3]
      
      index = index + 4
      formattedArray.append(formattedDictionary)
    }
    return formattedArray
  }
  
  //  The database is really tricky
  //  We only need the rank column
  static func onlyRankColumnArray(JSONArray: Array<[String:String]>) -> [String] {
    var columnArray = [String]()
    for item in JSONArray {
      columnArray.append(item["Rank"]!)
    }
    return columnArray
  }
  
  // MARK: - 
  
  // This method is used to format the string according to the current JSON format
  static func rightJSONString(string: String) -> String {
    return "[" + string.components(separatedBy:"[")[1]
  }
}

