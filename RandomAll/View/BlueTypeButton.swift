//
//  BlueTypeButton.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit

class BlueTypeButton: UIButton {

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupUI()
  }

  func setupUI() {
    self.backgroundColor = Style.current.color.blueTypeButtonBackground
    self.layer.cornerRadius = Style.current.metric.typeButtonRadius
  }
}
