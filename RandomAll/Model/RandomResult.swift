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
  var teams = List<Team>()

  class func all() -> Results<RandomResult> {
    return try! Realm().objects(RandomResult)
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
