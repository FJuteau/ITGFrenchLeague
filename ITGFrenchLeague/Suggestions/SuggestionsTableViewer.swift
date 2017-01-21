//
//  SuggestionsTableViewer.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 31/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

class SuggestionsTableViewer: UITableViewController {
  
  let data = DataRetainer.suggestions
  
  override func viewDidLoad() {
    
    self.tableView.backgroundColor = UIColor.black
    self.tableView.register(UINib(nibName: "SuggestionsTableViewCell", bundle: nil), forCellReuseIdentifier: "SuggestionsRankingCellID")
  }
}

// MARK : Table View Delegate

extension SuggestionsTableViewer {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if let data = data {
      
      return data.count
    }
    return 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "SuggestionsRankingCellID") as? SuggestionsTableViewCell,
      let data = data {
      
      let ranking = data[indexPath.row]
      let viewModel = SuggestionsTableViewModel(with: ranking)
      cell.configure(with: viewModel)
      
      return cell
    }
    
    return UITableViewCell()
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }
  
  override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }
}
