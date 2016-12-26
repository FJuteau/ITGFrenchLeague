//
//  MonthlyRankingTableViewer.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 19/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

class MonthlyRankingTableViewer: UITableViewController {
  
  var data: [[MonthlyRank]] {
    
    return DataRetainer.songSortedSpeedRank
  }
  
  override func viewDidLoad() {
    
    self.tableView.backgroundColor = UIColor.black
  }
  
}

// MARK : Table View Delegate

extension MonthlyRankingTableViewer {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return data[section].count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "RankingCellID") as? RankingTableViewCell {
      
      let song = data[indexPath.section][indexPath.row]
      let viewModel = RankingTableViewModel(with: song)
      cell.configure(with: viewModel)
      
      return cell
    }
    
    return UITableViewCell()
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return data.count
  }
}
