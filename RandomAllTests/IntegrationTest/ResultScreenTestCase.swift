//
//  ResultScreenTestCase.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import XCTest
import KIF
@testable import RandomAll

class ResultScreenTestCase: BaseTestCase {

  override func beforeEach() {
    super.beforeEach()
    tester.tapViewWithAccessibilityLabel("Teams")
    tester.tapViewWithAccessibilityLabel("Seed")
    tester.waitForTimeInterval(0.2)
    self.addPlayers()
    let tableView = tester.waitForViewWithAccessibilityLabel("tableView") as! UITableView
    tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 3), atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
    tester.clearTextFromAndThenEnterText("2", intoViewWithAccessibilityLabel: "SubmitCell - number of teams")
    tapSubmitButton()
  }

  func testElements() {
    tester.waitForViewWithAccessibilityLabel("Teams")
    tester.waitForViewWithAccessibilityLabel("Team 1")
    tester.waitForViewWithAccessibilityLabel("Save")
    tester.waitForViewWithAccessibilityLabel("Edit")
  }

  func testSave() {
    tester.tapViewWithAccessibilityLabel("Save")
    tester.clearTextFromAndThenEnterText("New List", intoViewWithAccessibilityLabel: "SaveResultViewController - Name Text Field")
    tester.tapViewWithAccessibilityLabel("Save")
    tester.tapViewWithAccessibilityLabel("OK")
  }

  func testEdit() {
    tester.tapViewWithAccessibilityLabel("Edit")
    tester.waitForViewWithAccessibilityLabel("+Add")
  }

  func tapSubmitButton() {
    let tableView = tester.waitForViewWithAccessibilityLabel("tableView") as! UITableView
    let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 3)) as! SubmitCell
    tester.tapAccessibilityElement(nil, inView: cell.randomizeButton)
  }

  func addPlayers() {
    let data = [
      ("Buu", "1"),
      ("Quang", "2"),
      ("Phong", ""),
      ("Vu", "3"),
    ]
    for item in data {
      self.addNewPlayer(name: item.0, seed: item.1)
    }
  }
}
