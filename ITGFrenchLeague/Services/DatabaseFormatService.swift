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

enum TabType : String {
  
  case playersTabName       = "Players"
  case songInfoTabName      = "SongInfo"
  case globalRankTabName    = "GlobalRank"
  case monthlyRankTabName   = "Rank"
  
  
  func formattedJSONResponse(entryArray: [[String:String]]) -> [[String:String]] {
    
    switch self {
    case .playersTabName:
      return entryArray
      
    case .songInfoTabName:
      return songInfoFormattedArray(array: entryArray)
      
    case .globalRankTabName:
      return entryArray
      
    case .monthlyRankTabName:
      return entryArray
    }
  }
  

  // MARK: - Song Info
  
  // This function is so ugly
  func songInfoFormattedArray(array: [[String:String]]) -> [[String:String]] {
    
    var formattedArray = [[String:String]]()
    var index = 0
    let rankColumnArray = columnArray(with: array, for: "Rank")
    while index < rankColumnArray.count {
      var formattedDictionary = [String:String]()
      
      formattedDictionary["title"]      = rankColumnArray[index]
      formattedDictionary["pack"]       = rankColumnArray[index+1]
      formattedDictionary["banner"]     = rankColumnArray[index+2]
      formattedDictionary["stepArtist"] = rankColumnArray[index+3]
      formattedDictionary["level"]      = rankColumnArray[index+4]
      
      index = index + 5
      formattedArray.append(formattedDictionary)
    }
    
    let typeColumnArray = columnArray(with: array, for: "Type")
    print("ojqsojdoqsjdqpjsdp\(typeColumnArray)")
    let typeSongArray = typeColumnArray.filter { isType(string: $0) }.map { normalize(string: $0) }
    
    if typeSongArray.count == formattedArray.count {
      index = 0
      while index < typeSongArray.count {
        
        formattedArray[index]["type"] = typeSongArray[index]
        index += 1
      }
    }
    
    return formattedArray
  }
  
  //  The database is really tricky
  //  We only need the rank column
  func columnArray(with jsonArray: [[String:String]], for key: String) -> [String] {
    
    var columnArray = [String]()
    for item in jsonArray {
      
      if let column = item[key] {
        
        columnArray.append(column)
      }
    }
    return columnArray
  }
  
  func isType(string: String) -> Bool {
    
    if string.contains("Speed") ||
      string.contains("Stamina") ||
      string.contains("Timing") {
      
      return true
    }
    return false
  }
  
  func normalize(string: String) -> String {
    
    let components = string.components(separatedBy: "-")
    return components[1]
  }
}

