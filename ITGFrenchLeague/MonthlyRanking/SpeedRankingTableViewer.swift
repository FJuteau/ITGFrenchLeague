//
//  SpeedRankingTableViewController.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 18/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

class SpeedRankingTableViewer: MonthlyRankingTableViewer {
 
  override var data: [[MonthlyRank]] {
    
    return DataRetainer.songSortedSpeedRank
  }
  
}

// MARK : Table View Delegate

extension SpeedRankingTableViewer {
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    return DataRetainer.songNames(for: .speed)[section]
  }
}
