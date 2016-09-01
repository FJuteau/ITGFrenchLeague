//
//  MainMenuViewer.swift
//  ITGFrenchLeague
//
//  Created by francois on 09/08/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation
import UIKit

class MainMenuViewer: UIViewController
{
  @IBOutlet weak var challengeButton: UIButton!
  @IBOutlet weak var monthlyRankingButton: UIButton!
  @IBOutlet weak var generalRankingButton: UIButton!
  @IBOutlet weak var sendScoreButton: UIButton!
  
  let challengeViewer       = ChallengeViewer()
  let generalRankingViewer  = GeneralRankingViewer()
  let monthlyRankingViewer  = MonthlyRankingViewer()
  
  //MARK: - Life cycle
  
  override func viewDidLoad() {
    challengeButton.addTarget(self, action: #selector(didTapOnChallengeButton), forControlEvents: .TouchUpInside)
    monthlyRankingButton.addTarget(self, action: #selector(didTapOnMonthlyRankingButton), forControlEvents: .TouchUpInside)
    generalRankingButton.addTarget(self, action: #selector(didTapOnGeneralRankingButton), forControlEvents: .TouchUpInside)
    sendScoreButton.addTarget(self, action: #selector(didTapOnSendScoreButton), forControlEvents: .TouchUpInside)
    
  }
  
  
  //MARK: - Button handling
  
  func didTapOnChallengeButton() {
    print("ALLO 1")
    self.presentViewController(challengeViewer, animated:true, completion:nil)
    
  }
  
  
  func didTapOnMonthlyRankingButton() {
    print("ALLO 2")
    self.presentViewController(monthlyRankingViewer, animated:true, completion:nil)
    
  }
  
  
  func didTapOnGeneralRankingButton() {
    print("ALLO 3")
    self.presentViewController(generalRankingViewer, animated:true, completion:nil)
  }
  
  
  func didTapOnSendScoreButton() {
    print("ALLO 4")
    
  }
  
  
  
}
