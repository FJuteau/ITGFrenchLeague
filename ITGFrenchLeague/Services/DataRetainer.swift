//
//  DataRetainer.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 10/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation

struct DataRetainer {
  
  static var players            : [String: Player]?
  static var songs              : [Song]?
  static var globalRank         : [GlobalRank]?
  static var overallMonthlyRank : [OverallMonthlyRank]?
  static var speedMonthlyRank   : [MonthlyRank]?
  static var staminaMonthlyRank : [MonthlyRank]?
  static var timingMonthlyRank  : [MonthlyRank]?
  
  static func songs(of type: SongType) -> [Song] {
    
    if let songs = songs {
      
      return songs.filter { $0.type == type }
    }
    return [Song]()
  }
  
  static func typeSortedSongs() -> [[Song]] {
    
    let speedSongs = songs(of: .speed)
    let staminaSongs = songs(of: .stamina)
    let timingSongs = songs(of: .timing)
    
    return [speedSongs, staminaSongs, timingSongs]
  }
  
  static func player(forName name: String) -> Player? {
    
    return players?[name]
  }
}
