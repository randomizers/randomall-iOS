//
//  RoundTextField.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit

class RoundTextField: UITextField {
  override func drawRect(rect: CGRect) {
    setupUI()
    super.drawRect(rect)
  }

  func setupUI() {
    self.layer.cornerRadius = Style.current.metric.typeButtonRadius
    self.clipsToBounds = true
  }
}
