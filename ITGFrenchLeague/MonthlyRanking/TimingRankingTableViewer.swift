//
//  TimingRankingTableViewer.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 19/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

class TimingRankingTableViewer: RankingRankingTableViewer {
  
  override var data: [[MonthlyRank]] {
    
    return DataRetainer.songSortedTimingRank
  }
}

// MARK : Table View Delegate

extension TimingRankingTableViewer {
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    return DataRetainer.songNames(for: .timing)[section]
  }
}
