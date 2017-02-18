//
//  MainMenuViewer.swift
//  ITGFrenchLeague
//
//  Created by francois on 09/08/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class MainMenuViewer: UIViewController {
  
  @IBOutlet weak var challengeButton: UIButton!
  @IBOutlet weak var monthlyRankingButton: UIButton!
  @IBOutlet weak var generalRankingButton: UIButton!
  @IBOutlet weak var sendScoreButton: UIButton!
  
  var loadedModelIndex = 0
  
  var numberOfModelToLoad = 3
  
  //MARK: - Life cycle
  
  override func viewDidLoad() {
    
    print("realm : \(Realm.Configuration.defaultConfiguration.fileURL!)")
    
    let realm = try! Realm()
    
    if let _ = realm.objects(SpeedMonthlyRank.self).first {
      
      DataRetainer.speedMonthlyRank.value = realm.objects(SpeedMonthlyRank.self).map { $0 }
      DataRetainer.staminaMonthlyRank.value = realm.objects(StaminaMonthlyRank.self).map { $0 }
      DataRetainer.timingMonthlyRank.value = realm.objects(TimingMonthlyRank.self).map { $0 }
      
    } else {
      
      self.monthlyRankingButton.isEnabled = false
    }
    
    DatabaseResponseService.JSONResponse(for: .speedMonthlyRank, genericType: SpeedMonthlyRank.self) { result in
      
      let sortedResult = result.sorted { $0.rank < $1.rank }
      DataRetainer.speedMonthlyRank.value = sortedResult
      self.incrementModelIndex()
      //        print("SPEED LOAD : \(sortedResult)")
    }
    DatabaseResponseService.JSONResponse(for: .staminaMonthlyRank, genericType: StaminaMonthlyRank.self) { result in
      
      let sortedResult = result.sorted { $0.rank < $1.rank }
      DataRetainer.staminaMonthlyRank.value = sortedResult
      self.incrementModelIndex()
      //        print("STAMINA LOAD : \(sortedResult)")
    }
    DatabaseResponseService.JSONResponse(for: .timingMonthlyRank, genericType: TimingMonthlyRank.self) { result in
      
      let sortedResult = result.sorted { $0.rank < $1.rank }
      DataRetainer.timingMonthlyRank.value = sortedResult
      //        print("TIMING LOAD : \(sortedResult)")
      self.incrementModelIndex()
    }
    
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    self.navigationItem.hidesBackButton = true
  }
  override func viewDidDisappear(_ animated: Bool) {
    self.navigationItem.hidesBackButton = false
  }
  
  private func incrementModelIndex() {
    
    loadedModelIndex += 1
    if loadedModelIndex == numberOfModelToLoad - 1 {
      DispatchQueue.main.async {
        self.monthlyRankingButton.isEnabled = true
      }
    }
  }
}


