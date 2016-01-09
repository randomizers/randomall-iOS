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
    tester.tapViewWithAccessibilityLabel("Players")
    tester.tapViewWithAccessibilityLabel("Seed")
    tester.waitForTimeInterval(0.2)
    let tableView = tester.waitForViewWithAccessibilityLabel("tableView") as! UITableView
    tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 3), atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
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
}
