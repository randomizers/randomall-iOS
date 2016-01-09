//
//  Team.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit
import RealmSwift

class Team: BaseModel {
  var players = List<Player>()
}
