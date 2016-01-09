//
//  _init_.swift
//  FITpin
//
//  Created by Buu Bui on 8/5/15.
//  Copyright (c) 2015 fitpin. All rights reserved.
//

import Foundation

class Style {
  static let current = Style()
  let color: Color
  let metric: Metric
  init(){
    color = Color()
    metric = Metric()
  }
}
