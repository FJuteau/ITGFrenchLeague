//
//  GeneralRankingTableView.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 18/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

class GeneralRankingTableViewer: UITableViewController {
  
  let data = DataRetainer.overallMonthlyRank
}

// MARK : Table View Delegate

extension GeneralRankingTableViewer {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if let data = data {
      
      return data.count
    }
    return 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralRankingCellID") as? GeneralRankingTableViewCell,
      let data = data {
      
      let ranking = data[indexPath.row]
      let viewModel = GeneralRankingTableViewCellViewModel(with: ranking)
      cell.configure(with: viewModel)
      
      return cell
    }
    
    return UITableViewCell()
  }
}
