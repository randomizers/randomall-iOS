//
//  RandomizerService.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit

class RandomizerService: NSObject {

  class func randomize(playerList: [Player], numberOfTeams: Int, categorizeType: CategorizeType = .None) -> RandomResult {
    let result = RandomResult()
    var arrayResult = [ArrayList<Player>]()
    if categorizeType == .Seed {
      arrayResult = doSeed(playerList, numberOfTeams: numberOfTeams)
    } else if categorizeType == .None {
      arrayResult = doNone(playerList, numberOfTeams: numberOfTeams)
    }
    for players in arrayResult {
      let team = Team()
      team.players.appendContentsOf(players)
      result.teams.append(team)
    }
    return result
  }

  class func doSeed(playerList: [Player], numberOfTeams: Int) -> [ArrayList<Player>] {
    var teams = [ArrayList<Player>]()
    for var i = 0; i < numberOfTeams; i++ {
      teams.append(ArrayList<Player>())
    }
    var seeds = [Int: ArrayList<Player>]()
    for player in playerList {
      let seed = player.seed
      if seeds[seed] == nil {
        seeds[seed] = ArrayList<Player>()
      }
      seeds[seed]?.append(player)
    }

    for players in seeds.values.shuffle() {
      for seedPlayers in Array(players).shuffle().splitEvery(numberOfTeams) {
        for player in seedPlayers {
          let team = smallestTeam(teams)
          team.append(player)
        }
      }
    }
    return teams
  }

  class func doNone(playerList: [Player], numberOfTeams: Int) -> [ArrayList<Player>] {
    var teams = [ArrayList<Player>]()
    for var i = 0; i < numberOfTeams; i++ {
      teams.append(ArrayList<Player>())
    }
    let arrayResult = playerList.shuffle().splitEvery(numberOfTeams)
    for players in arrayResult {
      for player in players {
        let team = smallestTeam(teams)
        team.append(player)
      }
    }
    return teams
  }

  class func smallestTeam(teams:[ArrayList<Player>]) -> ArrayList<Player> {
    var result = teams.first!
    for team in teams {
      if result.count > team.count {
        result = team
      }
    }
    return result
  }
}
