//
//  DataCell.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell {
  @IBOutlet weak var container: UIView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var seedLabel: UILabel!

  override func setHighlighted(highlighted: Bool, animated: Bool) {
    container.backgroundColor = highlighted ? Style.current.color.dataCellBackground : Style.current.color.dataCellHighlightBackground
  }
  override func setSelected(selected: Bool, animated: Bool) {
    container.backgroundColor = selected ? Style.current.color.dataCellBackground : Style.current.color.dataCellHighlightBackground
  }
}
