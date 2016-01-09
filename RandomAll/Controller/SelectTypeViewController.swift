//
//  SelectTypeViewController.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit

class SelectTypeViewController: BaseViewController {
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var playerButton: UIButton!
  @IBOutlet weak var teamButton: UIButton!
  @IBOutlet weak var groupButton: UIButton!

  @IBAction func playerButtonClicked(sender: UIButton) {
    let controller = NewRandomizeViewController.instantiateStoryboard()
    controller.gameType = .Players
    controller.categorizeType = .None
    controller.numberOfTeams = 1
    self.navigationController?.pushViewController(controller, animated: true)
  }

  @IBAction func teamButtonClicked(sender: UIButton) {
    showCategorizeController(gameType: .Teams)
  }

  @IBAction func groupsButtonClicked(sender: UIButton) {
    showCategorizeController(gameType: .Groups)
  }

  func showCategorizeController(gameType gameType: GameType) {
    let controller = CategorizeViewController.instantiateStoryboard()
    controller.gameType = gameType
    self.navigationController?.pushViewController(controller, animated: true)
  }
}
