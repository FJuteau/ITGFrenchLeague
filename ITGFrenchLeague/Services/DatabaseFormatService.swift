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
  case suggestions
  
  
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
      
    case .suggestions:
      return "Suggestions"
    }
  }
  
  
  func formattedJSONResponse(entryArray: [[String:String]]) -> [[String:String]] {
    
    switch self {
    case .players,
         .globalRank,
         .overallMonthlyRank,
         .suggestions:
      return entryArray
      
    case .songInfo:
      return formattedSongInfo(from: entryArray)
      
    case .speedMonthlyRank,
         .staminaMonthlyRank,
         .timingMonthlyRank:
      return formattedRank(from: entryArray)
    }
  }
  
  func songType() -> SongType {
    
    switch self {
      
    case .speedMonthlyRank:
      return .speed
      
    case .staminaMonthlyRank:
      return .stamina
      
    case .timingMonthlyRank:
      return .timing
      
    default:
      return .speed
    }
  }
  
  func rankColumn() -> String {
    
    switch self {
      
    case .speedMonthlyRank:
      return "Speed Rank"
      
    case .staminaMonthlyRank:
      return "Stamina Rank"
      
    case .timingMonthlyRank:
      return "Timing Rank"
      
    default:
      return "none"
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
  
  func formattedRank(from array: [[String:String]]) -> [[String:String]] {
    
    let songsTitle = DataRetainer.songs(of: songType()).map { $0.title }
    let formattedRanks = array.map { mappingRank(from: $0, withSongTitles: songsTitle) }
    
    return formattedRanks
  }
  
  func mappingRank(from array: [String:String], withSongTitles songTitles: [String]) -> [String:String] {
    
    guard let playerName  = array["Player"],
      let rank            = array[rankColumn()] else { return [String: String]() }
    
    var songTitle = ""
    var songScore = ""
    
    for oneSongTitle in songTitles {
      
      if let oneSongScore = array[oneSongTitle], oneSongScore != "" {
        
        songTitle = oneSongTitle
        songScore = oneSongScore
      }
    }
    let mappedArray = ["Player": playerName, "Rank": rank, "SongTitle": songTitle, "SongScore": songScore]
    
    return mappedArray
  }
}

