//
//  ResultCell.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var seedLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
  }
  override func setHighlighted(highlighted: Bool, animated: Bool) {}
}