//
//  TwoLineTextWithButtonCell.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit

class TwoLineTextWithButtonCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var button: RoundButton!
  weak var delegate:TwoLineTextWithButtonCellDelegate?

  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }

  func setupUI() {
    self.backgroundColor = UIColor.clearColor()
    contentView.backgroundColor = UIColor.clearColor()
  }

  @IBAction func buttonClicked(sender: UIButton) {
    delegate?.cell?(self, buttonClicked: sender)
  }

  override func setHighlighted(highlighted: Bool, animated: Bool) {}
}

@objc protocol TwoLineTextWithButtonCellDelegate {
  optional func cell(cell: TwoLineTextWithButtonCell, buttonClicked button: UIButton)
}
