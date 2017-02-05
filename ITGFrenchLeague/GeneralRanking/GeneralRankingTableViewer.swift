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
  
  let data = DataRetainer.overallMonthlyRank
  
  //var dataVariable: Variable<[OverallMonthlyRank]?> = Variable(DataRetainer.overallMonthlyRank)
  
  var dataObservable: Observable<[OverallMonthlyRank]?>!
  
  fileprivate let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    
    self.tableView.backgroundColor = UIColor.black
    
    dataObservable = Observable.just(data)
      //.observeOn(ConcurrentDispatchQueueScheduler(qos: .userInteractive))
      .do(onNext: { data in
        self.tableView.reloadData()
    })
    
    /*dataObservable = dataVariable.asObservable()
    dataObservable.subscribe(onNext: { data in
      self.tableView.reloadData()
    }).addDisposableTo(disposeBag)*/
  }
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
