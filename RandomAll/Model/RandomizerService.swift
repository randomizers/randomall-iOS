//
//  RandomizerService.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit

class RandomizerService: NSObject {
  class func random(players:[Player], numberOfTeams: Int) -> Result {
    let result = Result()
    let team = Team()
    team.players.appendContentsOf(players)
    result.teams.append(team)
    return result
  }
}
