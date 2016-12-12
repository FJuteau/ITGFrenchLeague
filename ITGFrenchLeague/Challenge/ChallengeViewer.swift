//
//  ChallengeViewer.swift
//  ITGFrenchLeague
//
//  Created by francois on 24/08/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

class ChallengeViewer: UIViewController {
  
  override func viewDidLoad() {
    
    DatabaseResponseService.JSONResponse(for: .songInfo, genericType: Song.self) { result in
      for itemDict in result  {
        print("itemDict : \(itemDict.title)")
      }
    }
  }
}
