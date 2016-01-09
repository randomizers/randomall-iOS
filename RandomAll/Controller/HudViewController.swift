//
//  HudViewController.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit

class HudViewController: UIViewController {
  func show(parentView: UIView) {
    self.view.frame = parentView.bounds
    parentView.addSubview(self.view)
  }

  func hide() {
    self.view.removeFromSuperview()
  }
}
