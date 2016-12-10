//
//  MonthlyRankingViewer.swift
//  ITGFrenchLeague
//
//  Created by francois on 12/08/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

class MonthlyRankingViewer: UIViewController {
  
  override func viewDidLoad() {
    
    DatabaseResponseService.JSONResponse(for: TabType.monthlyRankTabName, genericType: SongInfoModel.self) { result in
      for itemDict in result  {
        print("itemDict : \(itemDict.title)")
      }
    }
  }
}
