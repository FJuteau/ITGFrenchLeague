//
//  GeneralRankingTableView.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 18/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit
import RxSwift

class GeneralRankingTableViewer: UITableViewController {
  
  var data = DataRetainer.overallMonthlyRank
  
  var rankObserver: Observable<[OverallMonthlyRank]>?
  
  var disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    
    self.tableView.backgroundColor = UIColor.black
    
    rankObserver = DataRetainer.overallMonthlyRank.asObservable()
    rankObserver?.subscribe(onNext: { [weak self] songs in
      
      self?.data = DataRetainer.overallMonthlyRank
      self?.tableView.reloadData()
    }).addDisposableTo(disposeBag)
  }
}

// MARK : Table View Delegate

extension GeneralRankingTableViewer {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return data.value.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralRankingCellID") as? GeneralRankingTableViewCell {
      
      let ranking = data.value[indexPath.row]
      let viewModel = GeneralRankingTableViewCellViewModel(with: ranking)
      cell.configure(with: viewModel)
      
      return cell
    }
    
    return UITableViewCell()
  }
}
