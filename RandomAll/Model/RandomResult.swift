//
//  Result.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit
import RealmSwift

class RandomResult: BaseModel {
  dynamic var name: String = ""
  dynamic var gameTypeValue: Int = 0
  dynamic var categorizeTypeValue: Int = 0
  var teams = List<Team>()

  class func all() -> Results<RandomResult> {
    return try! Realm().objects(RandomResult)
  }

  func players() -> [Player] {
    var result = [Player]()
    for team in teams {
      result.appendContentsOf(team.players)
    }
    return result
  }

  func gameType() -> GameType {
    return GameType(rawValue: gameTypeValue)!
  }

  func displayName() -> String {
    if name.characters.count > 0 {
      return name
    } else {
      return gameTypeValue == GameType.Groups.rawValue ? "Groups" : "Teams"
    }
  }

  func categorizeType() -> CategorizeType {
    return CategorizeType(rawValue: categorizeTypeValue)!
  }

  override func write() {
    for team in teams {
      if team.id == 0 {
        team.id = Team.nextId()
        team.write()
      }
    }
    super.write()
  }
}
