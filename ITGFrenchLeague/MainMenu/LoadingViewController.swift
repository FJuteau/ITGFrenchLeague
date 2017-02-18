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
  
  var isAlreadyLoaded = false
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    activityIndicatorView.startAnimating()
    
    DatabaseResponseService.JSONResponse(for: .players, genericType: Player.self) { result in
      
      let players = [String: Player](elements:result.map { ($0.name, $0) })
      DataRetainer.players.value = players
      self.incrementModelIndex()
    }
    DatabaseResponseService.JSONResponse(for: .songInfo, genericType: Song.self) { result in
      
      DataRetainer.songs.value = result
      self.incrementModelIndex()
//      print(result)
    }
    DatabaseResponseService.JSONResponse(for: .globalRank, genericType: GlobalRank.self) { result in
      
      let sortedResult = result.sorted { $0.rank < $1.rank }
      DataRetainer.globalRank.value = sortedResult
//      print(sortedResult)
    }
    DatabaseResponseService.JSONResponse(for: .overallMonthlyRank, genericType: OverallMonthlyRank.self) { result in
      
      let sortedResult = result.sorted { $0.rank < $1.rank }
      DataRetainer.overallMonthlyRank.value = sortedResult
      self.incrementModelIndex()
//      print(sortedResult)
    }
    DatabaseResponseService.JSONResponse(for: .suggestions, genericType: Suggestion.self) { result in
      
      DataRetainer.suggestions.value = result
      self.incrementModelIndex()
//      print("Suggestion : \(result)")
    }
    
    let realm = try! Realm()
    
    if let _ = realm.objects(Player.self).first {
      
      let players = realm.objects(Player.self)
      DataRetainer.players.value            = [String: Player](elements:players.map { ($0.name, $0) })
      
      DataRetainer.songs.value              = realm.objects(Song.self).map { $0 }
      DataRetainer.globalRank.value         = realm.objects(GlobalRank.self).map { $0 }
      DataRetainer.overallMonthlyRank.value = realm.objects(OverallMonthlyRank.self).map { $0 }
      
      DataRetainer.suggestions.value        = realm.objects(Suggestion.self).map { $0 }
      
      isAlreadyLoaded = true
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let controller = storyboard.instantiateViewController(withIdentifier: "MainMenuViewer")
      self.navigationController?.pushViewController(controller, animated: true)
    }
    
  }

  private func incrementModelIndex() {
  
    loadedModelIndex += 1
    if !isAlreadyLoaded, loadedModelIndex == numberOfModelToLoad - 1 {
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
