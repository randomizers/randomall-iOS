//
//  SetupViewController.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit

enum GameType: Int {
  case Players = 0
  case Teams = 1
  case Groups = 2

  func title() -> String {
    switch self {
    case .Players: return "Players"
    case .Teams: return "Teams"
    case .Groups: return "Groups"
    }
  }
}

class CategorizeViewController: BaseViewController {
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var seedButton: UIButton!
  @IBOutlet weak var strengthButton: UIButton!
  @IBOutlet weak var noneButton: BlueTypeButton!

  var gameType: GameType = .Players

  class func instantiateStoryboard() -> CategorizeViewController {
    return Helper.Storyboard.main().instantiateViewControllerWithIdentifier("categorize_view_controller") as! CategorizeViewController
  }

  @IBAction func seedButtonClicked(sender: UIButton) {
    showNewRandomizeController(gameType: gameType, categorizeType: .Seed)
  }

  @IBAction func strengthButtonClicked(sender: UIButton) {
    showNewRandomizeController(gameType: gameType, categorizeType: .Strength)
  }

  @IBAction func noneButtonClicked(sender: UIButton) {
    showNewRandomizeController(gameType: gameType, categorizeType: .None)
  }

  func showNewRandomizeController(gameType gameType: GameType, categorizeType: CategorizeType) {
    let controller = NewRandomizeViewController.instantiateStoryboard()
    controller.categorizeType = categorizeType
    controller.gameType = gameType
    self.navigationController?.pushViewController(controller, animated: true)
  }
}
