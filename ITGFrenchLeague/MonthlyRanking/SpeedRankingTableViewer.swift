//
//  SpeedRankingTableViewController.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 18/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit
import RxSwift

class SpeedRankingTableViewer: MonthlyRankingTableViewer {
  
  var rankObserver: Observable<[SpeedMonthlyRank]>?
  
  var disposeBag = DisposeBag()
  
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    rankObserver = DataRetainer.speedMonthlyRank.asObservable()
    rankObserver?.subscribe(onNext: { [weak self] songs in
      
      self?.data = DataRetainer.songSortedSpeedRank
      self?.tableView.reloadData()
    }).addDisposableTo(disposeBag)
    
  }
}

// MARK : Table View Delegate

extension SpeedRankingTableViewer {
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    return DataRetainer.songNames(for: .speed)[section]
  }
}
