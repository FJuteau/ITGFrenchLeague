//
//  GeneralRankingViewer.swift
//  ITGFrenchLeague
//
//  Created by francois on 09/08/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//
import UIKit

class GeneralRankingViewer: UIViewController {
  
  override func viewDidLoad() {
    
    DatabaseResponseService.JSONResponse(for: TabType.playersTabName, genericType: PlayerModel.self) { result in
      for itemDict in result  {
        print("itemDict : \(itemDict.name)")
      }
    }
  }
  
  
  
  // Process the response and display output
//  func displayResultWithTicket(ticket: GTLServiceTicket,
//                               finishedWithObject object : GTLObject,
//                                                  error : NSError?) {
//    
//    if let error = error {
//      showAlert("Error", message: error.localizedDescription)
//      return
//    }
//    
//    var majorsString = ""
//    let rows = object.JSON["values"] as! [[String]]
//    
//    if rows.isEmpty {
//      output.text = "No data found."
//      return
//    }
//    
//    majorsString += "Players, Rank:\n"
//    for row in rows {
//      let name = row[0] ?? "Unknown"
//      let major = row[1] ?? "Unknown"
//      
//      majorsString += "\(name), \(major)\n"
//    }
//    
//    output.text = majorsString
//  }
}
