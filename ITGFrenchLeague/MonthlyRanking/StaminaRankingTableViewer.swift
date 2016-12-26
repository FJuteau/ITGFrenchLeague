//
//  StaminaRankingTableViewer.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 19/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//
import UIKit

class StaminaRankingTableViewer: MonthlyRankingTableViewer {
  
  override var data: [[MonthlyRank]] {
    
    return DataRetainer.songSortedStaminaRank
  }
}

// MARK : Table View Delegate

extension StaminaRankingTableViewer {
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    return DataRetainer.songNames(for: .stamina)[section]
  }
}
