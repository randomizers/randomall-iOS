//
//  SaveResultViewController.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit

class SaveResultViewController: HudViewController {

  @IBOutlet weak var nameTextField: RoundTextField!
  weak var delegate: SaveResultViewControllerDelegate?

  init() {
    super.init(nibName: "SaveResultViewController", bundle: nil)

  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  @IBAction func saveButtonClicked(sender: UIButton) {
    delegate?.saveResultViewController?(self, clickedSaveButton: sender)
    hide()
  }


  @IBAction func cancelButtonClicked(sender: UIButton) {
    delegate?.saveResultViewController?(self, clickedCancelButton: sender)
    hide()
  }
}

@objc protocol SaveResultViewControllerDelegate {
  optional func saveResultViewController(controller: SaveResultViewController, clickedSaveButton: UIButton)
  optional func saveResultViewController(controller: SaveResultViewController, clickedCancelButton: UIButton)
}
