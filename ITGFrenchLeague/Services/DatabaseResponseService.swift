//
//  DatabaseResponseService.swift
//  ITGFrenchLeague
//
//  Created by francois on 10/08/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation

enum DatabaseURLConstants: String {
  case scriptURL            = "https://script.google.com/macros/s/AKfycbyoUM3T59g2gjSDBdVjQXph7recGj8WgsVDpnP3kKL9JTwYrhxa/exec?"
  case actionTypeParam      = "action=getTable"
  case spreadsheetIdParam   = "ssid=1UFzH3GTR2cUoa1cTw4bHqxPWB5EQ4I_EEViV4Yo-Uxo"
  
  // Tab types
  case tabNameKey               = "type"
  case playersTabNameValue      = "Players"
  case songInfoTabNameValue     = "SongInfo"
  case generalRankTabNameValue  = "GlobalRank"
  case monthlyRankTabNameValue  = "Rank"
}


class DatabaseResponseService {
  
  let urlSession = URLSession.shared
  
  func JSONResponse<TabModel: TabModelProtocol>(forTabType tabType: String, genericType: TabModel.Type, result:@escaping ([TabModel]) -> Void) {
    
    self.urlSession.dataTask(with: "\(DatabaseURLConstants.scriptURL)\(DatabaseURLConstants.actionTypeParam)&\(DatabaseURLConstants.tabNameKey)=\(tabType)&\(DatabaseURLConstants.spreadsheetIdParam)") {
      (data, response, error) in
        
        if let resultString = response.result.value {
          let JSONString = DatabaseFormatService.rightJSONString(string: resultString)
          let data = JSONString.data(using: String.Encoding.utf8)
          
          do {
            let databaseArray = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
            
            print("databaseArray: \(databaseArray)")
            if let JSONArray = databaseArray as? Array<[String : String]> {
//              print("JSON: \(JSONArray)")
              // This call shouldn't exist but since the database is oddly formatted we have to pass through this
              let formattedJSONArray = DatabaseFormatService.formattedJSONResponse(entryArray: JSONArray, tabType: tabType)
              
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
