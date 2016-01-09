//
//  SubmitCell.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit

class SubmitCell: UITableViewCell {
  @IBOutlet weak var participantsLabel: UILabel!
  @IBOutlet weak var numberOfTeamTextField: RoundTextField!
  @IBOutlet weak var randomizeButton: UIButton!

  weak var delegate: SubmitCellDelegate?

  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }

  func setupUI() {
    self.backgroundColor = UIColor.clearColor()
    contentView.backgroundColor = UIColor.clearColor()
  }
  @IBAction func submitButtonClicked(sender: UIButton) {
    delegate?.cellDidSubmit?(cell: self)
  }

  override func setHighlighted(highlighted: Bool, animated: Bool) {}
  override func setSelected(selected: Bool, animated: Bool) {}
}

@objc protocol SubmitCellDelegate {
  optional func cellDidSubmit(cell cell: SubmitCell)
}
