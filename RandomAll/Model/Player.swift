//
//  Player.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit
import RealmSwift

class Player: BaseModel {
  dynamic var name: String = ""
  dynamic var seed: Int = 0

  func seedString() -> String {
    return seed > 0 ? "\(seed)" : ""
  }

  func findByName(name: String) -> Player? {
    return nil
  }
}
