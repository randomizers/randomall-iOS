//
//  SelectTypeScreenTestCase.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

class SelectTypeScreenTestCase: BaseTestCase {
  func testElements() {
    tester.waitForViewWithAccessibilityLabel("Navigation Menu Button");
    tester.waitForViewWithAccessibilityLabel("How do you want\nto randomize?");
    tester.waitForViewWithAccessibilityLabel("Players");
    tester.waitForViewWithAccessibilityLabel("Teams");
    tester.waitForViewWithAccessibilityLabel("Groups");
  }

  func testPlayersButtonClick() {
    tester.tapViewWithAccessibilityLabel("Players")
    tester.waitForViewWithAccessibilityLabel("How do you want to\ncategorize?");
  }

  func testTeamsButtonClick() {
    tester.tapViewWithAccessibilityLabel("Teams")
    tester.waitForViewWithAccessibilityLabel("How do you want to\ncategorize?");
  }

  func testGroupsButtonClick() {
    tester.tapViewWithAccessibilityLabel("Groups")
    tester.waitForViewWithAccessibilityLabel("How do you want to\ncategorize?");
  }
}
