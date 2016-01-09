//
//  SetupScreenTestCase.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import XCTest

class CategorizeScreenTestCase: BaseTestCase {

  override func beforeEach() {
    super.beforeEach()
    tester.tapViewWithAccessibilityLabel("Players")
  }

  func testElements() {
    tester.waitForViewWithAccessibilityLabel("How do you want to\ncategorize?");
    tester.waitForViewWithAccessibilityLabel("Seed");
    tester.waitForViewWithAccessibilityLabel("Strength");
    tester.waitForViewWithAccessibilityLabel("None");
  }
}
