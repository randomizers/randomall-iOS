//
//  HistoryScreenTestCase.swift
//  RandomAll
//
//  Created by Buu Bui on 1/10/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import KIF
@testable import RandomAll
import RealmSwift

class HistoryScreenTestCase: BaseTestCase {
  override func beforeEach() {
    super.beforeEach()
    initResults()
    tester.tapViewWithAccessibilityLabel("Navigation Menu Button")
  }

  func testElements() {
    tester.waitForViewWithAccessibilityLabel("Alpha")
    tester.waitForViewWithAccessibilityLabel("Beta")
    tester.waitForViewWithAccessibilityLabel("Delta")
  }

  func testViewHistory() {
    tester.tapRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), inTableViewWithAccessibilityIdentifier: "HistoryController - tableView")
    tester.waitForViewWithAccessibilityLabel("Nam")
    tester.waitForViewWithAccessibilityLabel("Vu")
  }

  func testReuseHistory() {
    tester.tapRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), inTableViewWithAccessibilityIdentifier: "HistoryController - tableView")
    tester.tapViewWithAccessibilityLabel("Re-use")
    tester.waitForViewWithAccessibilityLabel("+Add")
  }

  func testDeleteHistory() {
    tester.tapRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), inTableViewWithAccessibilityIdentifier: "HistoryController - tableView")
    tester.tapViewWithAccessibilityLabel("Delete")
    tester.waitForViewWithAccessibilityLabel("How do you want\nto randomize?");
  }


  func initResults() {
    let players = initPlayers()
    for item in [(CategorizeType.Seed, 3, "Alpha"), (.None, 2, "Beta"), (.Seed, 4, "Delta")] {
      let result = RandomizerService.randomize(players, numberOfTeams: item.1, categorizeType: item.0)
      result.id = RandomResult.nextId()
      result.name = item.2
      result.write()
    }
  }

  func initPlayers() -> [Player] {
    let data = [
      ("Buu", 1),
      ("Nam", 0),
      ("Quang", 2),
      ("Vu", 1),
      ("Thanh", 2),
      ("Tan", 1),
      ("Cong", 1)
    ]
    var players = [Player]()
    for item in data {
      players.append(initPlayer(name: item.0, seed: item.1))
    }
    return players
  }

  func initPlayer(name name:String, seed: Int) -> Player {
    let player = Player()
    player.id = Player.nextId()
    player.name = name
    player.seed = seed
    player.write()
    return player
  }
}
