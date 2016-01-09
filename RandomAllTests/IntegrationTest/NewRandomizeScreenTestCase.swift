//
//  NewRandomizeScreenTestCase.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

class NewRandomizeScreenTestCase: BaseTestCase {
  override func beforeEach() {
    super.beforeEach()
    tester.tapViewWithAccessibilityLabel("Players")
    tester.tapViewWithAccessibilityLabel("Seed")
  }

  func testElements() {
    tester.waitForViewWithAccessibilityLabel("Players")
    tester.waitForViewWithAccessibilityLabel("Seed")
    tester.waitForViewWithAccessibilityLabel("Add names")
    tester.waitForViewWithAccessibilityLabel("+Add")
  }

  func testAddNewPlayer() {
    let name = "Tommy"
    let seed = "3"
    addNewPlayer(name: name, seed: seed)
    tester.waitForViewWithAccessibilityLabel("\(name), \(seed)")
  }
}

extension NewRandomizeScreenTestCase {
  func addNewPlayer(name name: String, seed: String) {
    tester.clearTextFromAndThenEnterText(name, intoViewWithAccessibilityLabel: "InputDataCell - Name textfield")
    tester.clearTextFromAndThenEnterText(seed, intoViewWithAccessibilityLabel: "InputDataCell - Seed textfield")
    tester.tapViewWithAccessibilityLabel("+Add")
  }
}
