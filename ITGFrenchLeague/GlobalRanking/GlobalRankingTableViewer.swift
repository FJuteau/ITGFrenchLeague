//
//  GlobalRankingTableViewer.swift
//  ITGFrenchLeague
//
//  Created by Francois JUTEAU on 29/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

class GlobalRankingTableViewer: UITableViewController {
  
  let data = DataRetainer.globalRank
  
  override func viewDidLoad() {
    
    self.tableView.backgroundColor = UIColor.black
    self.tableView.register(UINib(nibName: "GlobalRankingTableViewCell", bundle: nil), forCellReuseIdentifier: "GlobalRankingCellID")
  }
}

// MARK : Table View Delegate

extension GlobalRankingTableViewer {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if let data = data {
      
      return data.count
    }
    return 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "GlobalRankingCellID") as? GlobalRankingTableViewCell,
      let data = data {
      
      let ranking = data[indexPath.row]
      let viewModel = GlobalRankingTableViewModel(with: ranking)
      cell.configure(with: viewModel)
      
      return cell
    }
    
    return UITableViewCell()
  }
}
