//
//  Result.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit
import RealmSwift

class Result: BaseModel {
  dynamic var name: String = ""
  var teams = List<Team>()

  class func all() -> Results<Result> {
    return try! Realm().objects(Result)
  }
}
