//
//  DatabaseResponseService.swift
//  ITGFrenchLeague
//
//  Created by francois on 10/08/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation

struct DatabaseURLConstants {
  static let scriptURL            = "https://script.google.com/macros/s/AKfycbyoUM3T59g2gjSDBdVjQXph7recGj8WgsVDpnP3kKL9JTwYrhxa/exec?"
  static let actionTypeParam      = "action=getTable"
  static let spreadsheetIdParam   = "ssid=1UFzH3GTR2cUoa1cTw4bHqxPWB5EQ4I_EEViV4Yo-Uxo"
  static let tabNameKey           = "type"
}


enum TabType : String {
  case playersTabName      = "Players"
  case songInfoTabName     = "SongInfo"
  case generalRankTabName  = "GlobalRank"
  case monthlyRankTabName  = "Rank"
}


class DatabaseResponseService {
  
  static let urlSession = URLSession.shared
  
  static func JSONResponse<TabModel: TabModelProtocol>(for tabType: TabType, genericType: TabModel.Type, result:@escaping ([TabModel]) -> Void) {
    
    // https://script.google.com/macros/s/AKfycbyoUM3T59g2gjSDBdVjQXph7recGj8WgsVDpnP3kKL9JTwYrhxa/exec?action=getTable&type=TabType&ssid=1UFzH3GTR2cUoa1cTw4bHqxPWB5EQ4I_EEViV4Yo-Uxo
    if let url = URL(string:"\(DatabaseURLConstants.scriptURL)\(DatabaseURLConstants.actionTypeParam)&\(DatabaseURLConstants.tabNameKey)=\(tabType.rawValue)&\(DatabaseURLConstants.spreadsheetIdParam)") {
      
      let dataTask = self.urlSession.dataTask(with: url) { (data, response, error) in
        
        if let data = data {
          do {
            if let resultString = String(data: data, encoding: String.Encoding.utf8) {
            let JSONString = DatabaseFormatService.rightJSONString(string: resultString)
            let data = JSONString.data(using: String.Encoding.utf8)
              
            let databaseArray = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
            
            print("databaseArray: \(databaseArray)")
            if let JSONArray = databaseArray as? Array<[String : String]> {
              //              print("JSON: \(JSONArray)")
              // This call shouldn't exist but since the database is oddly formatted we have to pass through this
              let formattedJSONArray = DatabaseFormatService.formattedJSONResponse(entryArray: JSONArray, tabType: tabType)
              
              var playerArray: Array<TabModel> = Array()
              for itemDict in formattedJSONArray {
                if let model = TabModel(withDictionary: itemDict) {
                  playerArray.append(model)
                }
              }
              result(playerArray)
            }
            else
            {
              // ERROR HANDLING
              print("ERROR WHITH THE JSON CONVERSTION")
            }
            }
          }
          catch {
            print(error)
          }
        }
      }
      dataTask.resume()
    }
  }
}
