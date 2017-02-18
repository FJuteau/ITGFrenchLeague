//
//  DataRetainer.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 10/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation
import RxSwift

struct DataRetainer {
  
  static var players            = Variable<[String: Player]>([String: Player]())
  static var songs              = Variable<[Song]>([Song]())
  static var globalRank         = Variable<[GlobalRank]>([GlobalRank]())
  static var overallMonthlyRank = Variable<[OverallMonthlyRank]>([OverallMonthlyRank]())
  static var speedMonthlyRank   = Variable<[SpeedMonthlyRank]>([SpeedMonthlyRank]())
  static var staminaMonthlyRank = Variable<[StaminaMonthlyRank]>([StaminaMonthlyRank]())
  static var timingMonthlyRank  = Variable<[TimingMonthlyRank]>([TimingMonthlyRank]())
  static var suggestions        = Variable<[Suggestion]>([Suggestion]())
  
  
  static func songs(of type: SongType) -> [Song] {
    
    //if let songs = songs {
      
      return songs.value.filter { $0.type == type }
    //}
    //return [Song]()
  }
  
  static func songNames(for type: SongType) -> [String] {
    
    let sortedSongs = typeSortedSongs[type.typeSection()]
    
    return sortedSongs.map { $0.title }
  }
  
  static var typeSortedSongs: [[Song]] {
    
    let speedSongs = songs(of: .speed)
    let staminaSongs = songs(of: .stamina)
    let timingSongs = songs(of: .timing)
    
    return [speedSongs, staminaSongs, timingSongs]
  }
  
  static var songSortedSpeedRank: [[SpeedMonthlyRank]] {
    
    //guard let speedMonthlyRank = speedMonthlyRank else { return [[SpeedMonthlyRank]]() }
    
    return songSortedMonthlyRank(for: .speed, from: speedMonthlyRank.value)
  }
  
  static var songSortedStaminaRank: [[StaminaMonthlyRank]] {
    
    //guard let staminaMonthlyRank = staminaMonthlyRank else { return [[StaminaMonthlyRank]]() }
    
    return songSortedMonthlyRank(for: .stamina, from: staminaMonthlyRank.value)
  }
  
  static var songSortedTimingRank: [[TimingMonthlyRank]] {
    
    //guard let timingMonthlyRank = timingMonthlyRank else { return [[TimingMonthlyRank]]() }
    
    return songSortedMonthlyRank(for: .timing, from: timingMonthlyRank.value)
  }
  
  private static func songSortedMonthlyRank<Rank: MonthlyRank>(for type: SongType, from monthlyRanks: [Rank]) -> [[Rank]] {
    
    let songNames = self.songNames(for: type)
    var songSortedRank = [[Rank]]()
    
    for song in songNames {
      
      let songRanks = monthlyRanks.filter { $0.songTitle == song }
      songSortedRank.append(songRanks)
    }
    
    return songSortedRank
  }
  
  static func player(forName name: String) -> Player? {
    
    return players.value[name]
  }
}
