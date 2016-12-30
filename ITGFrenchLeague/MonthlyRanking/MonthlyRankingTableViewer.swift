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
    self.tableView.register(UINib(nibName: "RankingTableViewCell", bundle: nil), forCellReuseIdentifier: "RankingCellID")
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
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
    let titleLabel = UILabel(frame: CGRect(x: 20, y: 8, width: tableView.frame.width, height: 20))
    titleLabel.font = UIFont.main(with: 25)
    titleLabel.textColor = UIColor.mainText
    titleLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
    
    let headerView = UIView()
    headerView.backgroundColor = UIColor.black
    headerView.addSubview(titleLabel)
    
    return headerView
  }
  
}
