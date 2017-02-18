//
//  SuggestionsTableViewer.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 31/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit
import RxSwift

class SuggestionsTableViewer: UITableViewController {
  
  var data = DataRetainer.suggestions
  
  var suggestionObserver: Observable<[Suggestion]>?
  
  var disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    
    self.tableView.backgroundColor = UIColor.black
    self.tableView.register(UINib(nibName: "SuggestionsTableViewCell", bundle: nil), forCellReuseIdentifier: "SuggestionsRankingCellID")
    
    suggestionObserver = DataRetainer.suggestions.asObservable()
    suggestionObserver?.subscribe(onNext: { [weak self] songs in
      
      self?.data = DataRetainer.suggestions
      self?.tableView.reloadData()
    }).addDisposableTo(disposeBag)
  }
}

// MARK : Table View Delegate

extension SuggestionsTableViewer {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return data.value.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "SuggestionsRankingCellID") as? SuggestionsTableViewCell {
      
      let ranking = data.value[indexPath.row]
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
