//
//  EditDataViewController.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit

class EditDataViewController: HudViewController {

  @IBOutlet weak var nameTextField: RoundTextField!
  @IBOutlet weak var seedTextField: RoundTextField!

  weak var delegate: EditDataViewControllerDelegate?

  init() {
    super.init(nibName: "EditDataViewController", bundle: nil)

  }

  required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
  }

  func setName(name: String, seed: String) {
    _ = view
    nameTextField.text = name
    seedTextField.text = seed
  }

  @IBAction func saveButtonClicked(sender: UIButton) {
    delegate?.editDataViewController?(self, clickedSaveButton: sender)
    hide()
  }

  @IBAction func deleteButtonClicked(sender: UIButton) {
    delegate?.editDataViewController?(self, clickedDeleteButton: sender)
    hide()
  }

  @IBAction func cancelButtonClicked(sender: UIButton) {
    delegate?.editDataViewController?(self, clickedCancelButton: sender)
    hide()
  }
}

@objc protocol EditDataViewControllerDelegate {
  optional func editDataViewController(controller: EditDataViewController, clickedSaveButton: UIButton)
  optional func editDataViewController(controller: EditDataViewController, clickedDeleteButton: UIButton)
  optional func editDataViewController(controller: EditDataViewController, clickedCancelButton: UIButton)
}
