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
  
  let monthlyRankingViewer  = MonthlyRankingViewer()
  
  //MARK: - Life cycle
  
  override func viewDidLoad() {
    /*challengeButton.addTarget(self, action: #selector(didTapOnChallengeButton), for: .touchUpInside)
    monthlyRankingButton.addTarget(self, action: #selector(didTapOnMonthlyRankingButton), for: .touchUpInside)
    generalRankingButton.addTarget(self, action: #selector(didTapOnGeneralRankingButton), for: .touchUpInside)
    sendScoreButton.addTarget(self, action: #selector(didTapOnSendScoreButton), for: .touchUpInside)
    */
    
    DatabaseResponseService.JSONResponse(for: .players, genericType: Player.self) { result in
      
      let players = [String: Player](elements:result.map { ($0.name, $0) })
      DataRetainer.players = players
    }
    DatabaseResponseService.JSONResponse(for: .songInfo, genericType: Song.self) { result in
      
      DataRetainer.songs = result
      print(result)
    }
    DatabaseResponseService.JSONResponse(for: .globalRank, genericType: GlobalRank.self) { result in
      
      let sortedResult = result.sorted { $0.rank < $1.rank }
      DataRetainer.globalRank = sortedResult
      print(sortedResult)
    }
    DatabaseResponseService.JSONResponse(for: .overallMonthlyRank, genericType: OverallMonthlyRank.self) { result in
      
      let sortedResult = result.sorted { $0.rank < $1.rank }
      DataRetainer.overallMonthlyRank = sortedResult
      
      DatabaseResponseService.JSONResponse(for: .speedMonthlyRank, genericType: MonthlyRank.self) { result in
        
        let sortedResult = result.sorted { $0.rank < $1.rank }
        DataRetainer.speedMonthlyRank = sortedResult
        print("SPEED LOAD : \(sortedResult)")
      }
      DatabaseResponseService.JSONResponse(for: .staminaMonthlyRank, genericType: MonthlyRank.self) { result in
        
        let sortedResult = result.sorted { $0.rank < $1.rank }
        DataRetainer.staminaMonthlyRank = sortedResult
        print("STAMINA LOAD : \(sortedResult)")
      }
      DatabaseResponseService.JSONResponse(for: .timingMonthlyRank, genericType: MonthlyRank.self) { result in
        
        let sortedResult = result.sorted { $0.rank < $1.rank }
        DataRetainer.timingMonthlyRank = sortedResult
        print("TIMING LOAD : \(sortedResult)")
      }
      print(sortedResult)
    }
    
  }
  
  
  //MARK: - Button handling
  
  func didTapOnChallengeButton() {
    print("ALLO 1")
    //self.present(challengeViewer, animated:true, completion:nil)
    
  }
  
  
  func didTapOnMonthlyRankingButton() {
    print("ALLO 2")
    self.present(monthlyRankingViewer, animated:true, completion:nil)
    
  }
  
  
  func didTapOnGeneralRankingButton() {
  }
  
  
  func didTapOnSendScoreButton() {
    print("ALLO 4")
    
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
