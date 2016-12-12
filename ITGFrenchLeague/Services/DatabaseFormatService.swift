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

enum TabType {
  
  case players
  case songInfo
  case globalRank
  case overallMonthlyRank
  case speedMonthlyRank
  case staminaMonthlyRank
  case timingMonthlyRank
  
  
  func tabName() -> String {
    
    switch self {
      
    case .players:
      return "Players"
      
    case .songInfo:
      return "SongInfo"
      
    case .globalRank:
      return "GlobalRank"
      
    case .overallMonthlyRank,
         .speedMonthlyRank,
         .staminaMonthlyRank,
         .timingMonthlyRank:
      return "Rank"
    }
  }
  
  
  func formattedJSONResponse(entryArray: [[String:String]]) -> [[String:String]] {
    
    switch self {
    case .players:
      return entryArray
      
    case .songInfo:
      return formattedSongInfo(from: entryArray)
      
    case .globalRank:
      return entryArray
      
    case .overallMonthlyRank:
      return entryArray
      
    case .speedMonthlyRank:
      return entryArray
      
    case .staminaMonthlyRank:
      return entryArray
      
    case .timingMonthlyRank:
      return entryArray
    }
  }
  

  // MARK: - Song Info
  
  // This function is so ugly
  func formattedSongInfo(from array: [[String:String]]) -> [[String:String]] {
    
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
  
  // MARK: - Overall Monthly Rank
  
  func formattedOverallRank(from array: [[String:String]]) -> [[String:String]] {
    
    
    return array
  }
}

