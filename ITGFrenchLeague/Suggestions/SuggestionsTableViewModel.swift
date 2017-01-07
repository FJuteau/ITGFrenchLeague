//
//  SuggestionsTableViewModel.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 31/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation

struct SuggestionsTableViewModel {
  
  var songTitleText: String
  var packText: String
  var proposePlayerText: String
  var levelText: String
  var statusText: String
  var likeCountText: String
  
  
  init(with suggestion: Suggestion) {
    
    songTitleText = suggestion.songTitle
    packText = suggestion.pack
    proposePlayerText = suggestion.playerName
    levelText = suggestion.level
    
    statusText = suggestion.status
    
    likeCountText = "\(suggestion.vote) joueurs aiment ce choix !"
  }
}
