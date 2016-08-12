//
//  DatabaseResponseService.swift
//  ITGFrenchLeague
//
//  Created by francois on 10/08/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import Foundation
import Alamofire

enum DatabaseURLConstants {
  static let scriptURL            = "https://script.google.com/macros/s/AKfycbyoUM3T59g2gjSDBdVjQXph7recGj8WgsVDpnP3kKL9JTwYrhxa/exec?"
  static let actionTypeParam      = "action=getTable"
  static let spreadsheetIdParam   = "ssid=1UFzH3GTR2cUoa1cTw4bHqxPWB5EQ4I_EEViV4Yo-Uxo"
  
  // Tab types
  static let playersTabNameParam  = "type=Players"
  static let songInfoTabNameParam = "type=SongInfo"
}


class DatabaseResponseService {
  
  func JSONResponse<TabModel: TabModelProtocol>(forTabType tabType: String, genericType: TabModel.Type, result:Array<TabModel> -> Void) {
    Alamofire.request(.POST, "\(DatabaseURLConstants.scriptURL)\(DatabaseURLConstants.actionTypeParam)&\(tabType)&\(DatabaseURLConstants.spreadsheetIdParam)")
      .responseString { response in
        
        if let resultString = response.result.value {
          let JSONString = self.rightJSONString(resultString)
          let data = JSONString.dataUsingEncoding(NSUTF8StringEncoding)
          
          do {
            let obj = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
            print("JSON: \(obj)")
            var playerArray: Array<TabModel> = Array()
            if let items = obj as? NSArray {
              for itemDict in items {
                let player = TabModel(withDictionary: itemDict as! [String : String])
                playerArray.append(player)
              }
            }
            result(playerArray)
          }
          catch {
            print(error)
          }
        }
    }
  }
  
  //MARK: - DATABASE WEIRDNESS
  
  // The database is really tricky
  // We only need the rank column
  func JSONResponseForSongInfo(result:Array<SongInfoModel> -> Void) {
    Alamofire.request(.POST, "\(DatabaseURLConstants.scriptURL)\(DatabaseURLConstants.actionTypeParam)&\(DatabaseURLConstants.songInfoTabNameParam)&\(DatabaseURLConstants.spreadsheetIdParam)")
      .responseString { response in
        
        if let resultString = response.result.value {
          let JSONString = self.rightJSONString(resultString)
          let data = JSONString.dataUsingEncoding(NSUTF8StringEncoding)
          
          do {
            let obj = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
            print("JSON: \(obj)")
            
            let columnArray = self.onlyRankColumnArray(obj as! NSArray)
            let JSONArray = self.formattedArray(columnArray)
            print("columnArray: \(columnArray)")
            print("JSONArray: \(JSONArray)")
            
            var songInfoArray: Array<SongInfoModel> = Array()
            for itemDict in JSONArray {
              let player = SongInfoModel(withDictionary: itemDict)
              songInfoArray.append(player)
            }
            result(songInfoArray)
          }
          catch {
            print(error)
          }
        }
    }
  }
  
  func formattedArray(columnArray: [String]) -> Array<[String:String]> {
    var formattedArray = Array<[String:String]>()
    var index = 0
    while index != columnArray.count {
      var formattedDictionary = [String:String]()
      
      formattedDictionary["title"]      = columnArray[index]
      formattedDictionary["pack"]       = columnArray[index+1]
      formattedDictionary["banner"]     = columnArray[index+2]
      formattedDictionary["stepArtist"] = columnArray[index+3]
      
      index = index + 4
      formattedArray.append(formattedDictionary)
    }
    return formattedArray
  }
  
  
  func onlyRankColumnArray(JSONArray: NSArray) -> [String] {
    var columnArray = [String]()
    for item in JSONArray {
      columnArray.append(item["Rank"])
    }
    return columnArray
  }
  
  
  // This method is used to format the string according to the current JSON format
  func rightJSONString(string: String) -> String {
    return "[" + string.componentsSeparatedByString("[")[1]
  }
  
}