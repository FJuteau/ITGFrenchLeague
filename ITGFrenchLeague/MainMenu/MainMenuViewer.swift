//
//  MainMenuViewer.swift
//  ITGFrenchLeague
//
//  Created by francois on 09/08/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation
import UIKit

class MainMenuViewer: UIViewController {
  
  @IBOutlet weak var challengeButton: UIButton!
  @IBOutlet weak var monthlyRankingButton: UIButton!
  @IBOutlet weak var generalRankingButton: UIButton!
  @IBOutlet weak var sendScoreButton: UIButton!
  
  var loadedModelIndex = 0
  
  var numberOfModelToLoad = 3
  
  //MARK: - Life cycle
  
  override func viewDidLoad() {
    
    self.navigationItem.hidesBackButton = true
    
    self.monthlyRankingButton.isEnabled = false
    
    DatabaseResponseService.JSONResponse(for: .speedMonthlyRank, genericType: MonthlyRank.self) { result in
      
      let sortedResult = result.sorted { $0.rank < $1.rank }
      DataRetainer.speedMonthlyRank = sortedResult
      self.incrementModelIndex()
      //        print("SPEED LOAD : \(sortedResult)")
    }
    DatabaseResponseService.JSONResponse(for: .staminaMonthlyRank, genericType: MonthlyRank.self) { result in
      
      let sortedResult = result.sorted { $0.rank < $1.rank }
      DataRetainer.staminaMonthlyRank = sortedResult
      self.incrementModelIndex()
      //        print("STAMINA LOAD : \(sortedResult)")
    }
    DatabaseResponseService.JSONResponse(for: .timingMonthlyRank, genericType: MonthlyRank.self) { result in
      
      let sortedResult = result.sorted { $0.rank < $1.rank }
      DataRetainer.timingMonthlyRank = sortedResult
      //        print("TIMING LOAD : \(sortedResult)")
      self.incrementModelIndex()
    }
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


