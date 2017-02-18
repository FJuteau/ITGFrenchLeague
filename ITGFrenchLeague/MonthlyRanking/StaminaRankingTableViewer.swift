//
//  StaminaRankingTableViewer.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 19/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//
import UIKit
import RxSwift

class StaminaRankingTableViewer: MonthlyRankingTableViewer {
  
  var rankObserver: Observable<[StaminaMonthlyRank]>?
  
  var disposeBag = DisposeBag()
  
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    rankObserver = DataRetainer.staminaMonthlyRank.asObservable()
    rankObserver?.subscribe(onNext: { [weak self] songs in
      
      self?.data = DataRetainer.songSortedStaminaRank
      self?.tableView.reloadData()
    }).addDisposableTo(disposeBag)
    
  }
}

// MARK : Table View Delegate

extension StaminaRankingTableViewer {
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    return DataRetainer.songNames(for: .stamina)[section]
  }
}
