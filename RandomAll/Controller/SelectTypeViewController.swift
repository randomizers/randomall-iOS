//
//  SelectTypeViewController.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit
import DynamicColor

class SelectTypeViewController: BaseViewController {
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var playerButton: UIButton!
  @IBOutlet weak var teamButton: UIButton!
  @IBOutlet weak var groupButton: UIButton!

  @IBAction func playerButtonClicked(sender: UIButton) {
    let controller = CategorizeViewController.instantiateStoryboard()
    self.navigationController?.pushViewController(controller, animated: true)
  }

  @IBAction func teamButtonClicked(sender: UIButton) {
    let controller = CategorizeViewController.instantiateStoryboard()
    self.navigationController?.pushViewController(controller, animated: true)
  }

  @IBAction func groupsButtonClicked(sender: UIButton) {
    let controller = CategorizeViewController.instantiateStoryboard()
    self.navigationController?.pushViewController(controller, animated: true)
  }
}
