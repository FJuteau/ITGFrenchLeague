//
//  ChallengeTableViewer.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 14/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation
import UIKit

class ChallengeTableViewer: UITableViewController {
  
  let data = DataRetainer.typeSortedSongs
  
}

// MARK : Table View Delegate 

extension ChallengeTableViewer {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
      return data[section].count
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    let songType = SongType.songType(forSection: section)
    return songType.typeTitle()
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "ChallengerCellID") as? ChallengeTableViewCell{
      
      let song = data[indexPath.section][indexPath.row]
      let viewModel = ChallengerTableViewCellViewModel(with: song)
      cell.configure(with: viewModel)
      
      return cell
    }
    
    return UITableViewCell()
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return data.count
  }
}
