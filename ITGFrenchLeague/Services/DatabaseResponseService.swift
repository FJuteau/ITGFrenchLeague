//
//  DatabaseResponseService.swift
//  ITGFrenchLeague
//
//  Created by francois on 10/08/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation
import Alamofire

struct DatabaseURLConstants {
  static let scriptURL            = "https://script.google.com/macros/s/AKfycbyoUM3T59g2gjSDBdVjQXph7recGj8WgsVDpnP3kKL9JTwYrhxa/exec?"
  static let actionTypeParam      = "action=getTable"
  static let spreadsheetIdParam   = "ssid=1UFzH3GTR2cUoa1cTw4bHqxPWB5EQ4I_EEViV4Yo-Uxo"
  
  // Tab types
  static let tabNameKey               = "type"
  static let playersTabNameValue      = "Players"
  static let songInfoTabNameValue     = "SongInfo"
  static let generalRankTabNameValue  = "GlobalRank"
  static let monthlyRankTabNameValue  = "Rank"
}


class DatabaseResponseService {
  
  func JSONResponse<TabModel: TabModelProtocol>(forTabType tabType: String, genericType: TabModel.Type, result:Array<TabModel> -> Void) {
    Alamofire.request(.POST, "\(DatabaseURLConstants.scriptURL)\(DatabaseURLConstants.actionTypeParam)&\(DatabaseURLConstants.tabNameKey)=\(tabType)&\(DatabaseURLConstants.spreadsheetIdParam)")
      .responseString { response in
        
        if let resultString = response.result.value {
          let JSONString = DatabaseFormatService.rightJSONString(resultString)
          let data = JSONString.dataUsingEncoding(NSUTF8StringEncoding)
          
          do {
            let databaseArray = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
            
            print("databaseArray: \(databaseArray)")
            if let JSONArray = databaseArray as? Array<[String : String]> {
//              print("JSON: \(JSONArray)")
              // This call shouldn't exist but since the database is oddly formatted we have to pass through this
              let formattedJSONArray = DatabaseFormatService.formattedJSONResponse(JSONArray, tabType: tabType)
              
              var playerArray: Array<TabModel> = Array()
              for itemDict in formattedJSONArray {
                let player = TabModel(withDictionary: itemDict)
                playerArray.append(player)
              }
              result(playerArray)
            }
            else
            {
              // ERROR HANDLING
              print("ERROR WHITH THE JSON CONVERSTION")
            }
            
          }
          catch {
            print(error)
          }
        }
    }
  }
  

  
  
  
  
}