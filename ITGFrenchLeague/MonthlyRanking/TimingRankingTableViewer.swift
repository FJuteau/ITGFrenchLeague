//
//  TimingRankingTableViewer.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 19/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit
import RxSwift

class TimingRankingTableViewer: MonthlyRankingTableViewer {
  
  var rankObserver: Observable<[TimingMonthlyRank]>?
  
  var disposeBag = DisposeBag()
  
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    rankObserver = DataRetainer.timingMonthlyRank.asObservable()
    rankObserver?.subscribe(onNext: { [weak self] songs in
      
      self?.data = DataRetainer.songSortedTimingRank
      self?.tableView.reloadData()
    }).addDisposableTo(disposeBag)
    
  }
}

// MARK : Table View Delegate

extension TimingRankingTableViewer {
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    return DataRetainer.songNames(for: .timing)[section]
  }
}
