//
//  LoadingViewController.swift
//  ITGFrenchLeague
//
//  Created by François Juteau on 21/01/2017.
//  Copyright © 2017 Fjuteau. All rights reserved.
//

import UIKit
import RealmSwift

class LoadingViewController: UIViewController {

  @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
  
  var loadedModelIndex = 0
  
  var numberOfModelToLoad = 5
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    activityIndicatorView.startAnimating()
    
    DatabaseResponseService.JSONResponse(for: .players, genericType: Player.self) { result in
      
      let players = [String: Player](elements:result.map { ($0.name, $0) })
      DataRetainer.players = players
      self.incrementModelIndex()
    }
    DatabaseResponseService.JSONResponse(for: .songInfo, genericType: Song.self) { result in
      
      DataRetainer.songs = result
      self.incrementModelIndex()
//      print(result)
    }
    DatabaseResponseService.JSONResponse(for: .globalRank, genericType: GlobalRank.self) { result in
      
      let sortedResult = result.sorted { $0.rank < $1.rank }
      DataRetainer.globalRank = sortedResult
//      print(sortedResult)
    }
    DatabaseResponseService.JSONResponse(for: .overallMonthlyRank, genericType: OverallMonthlyRank.self) { result in
      
      let sortedResult = result.sorted { $0.rank < $1.rank }
      DataRetainer.overallMonthlyRank = sortedResult
      self.incrementModelIndex()
//      print(sortedResult)
    }
    DatabaseResponseService.JSONResponse(for: .suggestions, genericType: Suggestion.self) { result in
      
      DataRetainer.suggestions = result
      self.incrementModelIndex()
//      print("Suggestion : \(result)")
    }
    
    
  }

  private func incrementModelIndex() {
  
    loadedModelIndex += 1
    if loadedModelIndex == numberOfModelToLoad - 1 {
      DispatchQueue.main.async {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MainMenuViewer")
        self.navigationController?.pushViewController(controller, animated: true)
      }
    }
  }
}

extension Dictionary {
  init(elements:[(Key, Value)]) {
    self.init()
    for (key, value) in elements {
      updateValue(value, forKey: key)
    }
  }
}
