//
//  BaseViewController.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  func setupUI() {
    self.view.backgroundColor = Style.current.color.viewBackground
    self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(Style.current.metric.navTitleFontSize), NSForegroundColorAttributeName: Style.current.color.navTitleColor]
    let menuButton = UIBarButtonItem(image: UIImage(named: "menu"), style: UIBarButtonItemStyle.Plain, target: self, action: "menuButtonClicked")
    menuButton.accessibilityLabel = "Navigation Menu Button"
    menuButton.tintColor = UIColor.whiteColor()
    self.navigationItem.rightBarButtonItem = menuButton
  }

  func menuButtonClicked() {
    UIAlertView(title: "Menu click", message: "Clicked", delegate: nil, cancelButtonTitle: "OK").show()
  }
}
