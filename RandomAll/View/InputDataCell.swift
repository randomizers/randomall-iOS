//
//  TwoLineTextWithInputCell.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit

class InputDataCell: UITableViewCell {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var seedTextField: RoundTextField!
  @IBOutlet weak var addButton: RoundButton!
  weak var delegate: InputDataCellDelegate?

  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }

  func setupUI() {
    self.backgroundColor = UIColor.clearColor()
    contentView.backgroundColor = UIColor.clearColor()
  }

  @IBAction func addButtonClicked(sender: UIButton) {
    delegate?.cellAddButtonClicked?(self)
  }

  override func setHighlighted(highlighted: Bool, animated: Bool) {}
}

@objc protocol InputDataCellDelegate {
  optional func cellAddButtonClicked(cell: InputDataCell)
}
