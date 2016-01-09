//
//  SetupViewController.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit

enum GameType: Int {
  case None = 0
  case Seed = 1
  case Strength = 2
}

class CategorizeViewController: BaseViewController {
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var seedButton: UIButton!
  @IBOutlet weak var strengthButton: UIButton!
  @IBOutlet weak var noneButton: BlueTypeButton!

  var gameType: GameType = .None

  class func instantiateStoryboard() -> CategorizeViewController {
    return Helper.Storyboard.main().instantiateViewControllerWithIdentifier("categorize_view_controller") as! CategorizeViewController
  }

  @IBAction func seedButtonClicked(sender: UIButton) {
  }

  @IBAction func strengthButtonClicked(sender: UIButton) {
  }

  @IBAction func noneButtonClicked(sender: UIButton) {
  }
}
