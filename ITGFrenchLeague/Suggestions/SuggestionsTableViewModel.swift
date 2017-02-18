//
//  SuggestionsTableViewModel.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 31/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit


struct SuggestionsTableViewModel {
  
  var songTitleText: String
  var packText: String
  var proposePlayerText: String
  var levelText: String
  var levelColor: UIColor
  var statusText: String
  var statusColor: UIColor
  var likeCountText: String
  
  
  init(with suggestion: Suggestion) {
    
    songTitleText = suggestion.songTitle
    packText = suggestion.pack
    proposePlayerText = suggestion.playerName
    levelText = suggestion.level
    if let level = Int(levelText) {
      levelColor = UIColor.level(for: level)
    } else {
      levelColor = UIColor.mainText
    }
    
    statusText = StatusParser.status(text: suggestion.status)
    statusColor = UIColor.status(for: statusText)
    
    likeCountText = "\(suggestion.vote) joueurs aiment ce choix !"
  }
  
}

enum SuggestionStatus: String {
  
  case invalidSuggestionStatus = "Non conforme"
  case validSuggestionStatus   = "Conforme"
  case waitingSuggestionStatus = "En attente"
}


fileprivate class StatusParser {
  
  static func status(text: String) -> String {
    
    if text.contains("NOK") || text.contains("NOT") {
      return SuggestionStatus.invalidSuggestionStatus.rawValue
    } else if text.contains("OK") {
      return SuggestionStatus.validSuggestionStatus.rawValue
    } else if text.contains("Pending") {
      return SuggestionStatus.waitingSuggestionStatus.rawValue
    }
    return text
  }
}
