//
//  GlobalRankingTableViewer.swift
//  ITGFrenchLeague
//
//  Created by Francois JUTEAU on 29/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit
import RxSwift

class GlobalRankingTableViewer: UITableViewController {
  
  var data = DataRetainer.globalRank
  
  var rankObserver: Observable<[GlobalRank]>?
  
  var disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    
    self.tableView.backgroundColor = UIColor.black
    self.tableView.register(UINib(nibName: "GlobalRankingTableViewCell", bundle: nil), forCellReuseIdentifier: "GlobalRankingCellID")
    
    rankObserver = DataRetainer.globalRank.asObservable()
    rankObserver?.subscribe(onNext: { [weak self] songs in
      
      self?.data = DataRetainer.globalRank
      self?.tableView.reloadData()
    }).addDisposableTo(disposeBag)
  }
}

// MARK : Table View Delegate

extension GlobalRankingTableViewer {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return data.value.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "GlobalRankingCellID") as? GlobalRankingTableViewCell {
      
      let ranking = data.value[indexPath.row]
      let viewModel = GlobalRankingTableViewModel(with: ranking)
      cell.configure(with: viewModel)
      
      return cell
    }
    
    return UITableViewCell()
  }
}
