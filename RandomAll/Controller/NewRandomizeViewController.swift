//
//  NewRandomizeViewController.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit

enum CategorizeType: Int {
  case None = 0
  case Seed = 1
  case Strength = 2
  func title() -> String {
    switch self {
    case .None: return "None"
    case .Seed: return "Seed"
    case .Strength: return "Strength"
    }
  }
}

class NewRandomizeViewController: BaseViewController, EditDataViewControllerDelegate {
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var bottomTableConstraint: NSLayoutConstraint!

  var gameType: GameType = .Players
  var categorizeType: CategorizeType = .None
  var data = Array<Player>()
  var numberOfTeams = 1
  let editViewController = EditDataViewController()

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  class func instantiateStoryboard() -> NewRandomizeViewController {
    return Helper.Storyboard.main().instantiateViewControllerWithIdentifier("NewRandomizeViewController") as! NewRandomizeViewController
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    editViewController.delegate = self
    for nibName in ["TwoLineTextWithButtonCell", "InputDataCell", "DataCell" , "SubmitCell"] {
      tableView.registerNib(UINib(nibName: nibName, bundle: NSBundle.mainBundle()), forCellReuseIdentifier: nibName)
    }
    tableView.delegate = self
    tableView.dataSource = self
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil)
    NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil)
  }

  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }

  func showRandomizeActionSheet(cell cell: TwoLineTextWithButtonCell) {
    let actionSheetController = UIAlertController(title: "Randomzie", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
    let closeAction: UIAlertAction = UIAlertAction(title: "Close", style: .Cancel, handler: nil)
    actionSheetController.addAction(closeAction)
    for type in [GameType.Players, .Teams, .Groups] {
      let action: UIAlertAction = UIAlertAction(title: type.title(), style: .Default) { [weak self] action in
        self?.gameType = type
        self?.tableView.reloadData()
      }
      actionSheetController.addAction(action)
    }
    self.presentViewController(actionSheetController, animated: true, completion: nil)
  }

  func showCategorizeActionSheet(cell cell: TwoLineTextWithButtonCell) {
    let actionSheetController = UIAlertController(title: "Categorize by", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
    let closeAction: UIAlertAction = UIAlertAction(title: "Close", style: .Cancel, handler: nil)
    actionSheetController.addAction(closeAction)
    for type in [CategorizeType.Seed, .Strength, .None] {
      let action: UIAlertAction = UIAlertAction(title: type.title(), style: .Default) { [weak self] action in
        self?.categorizeType = type
        self?.tableView.reloadData()
      }
      actionSheetController.addAction(action)
    }
    self.presentViewController(actionSheetController, animated: true, completion: nil)
  }
  func showEditRowView(index index: Int) {
    let item = self.data[index]
    _ = editViewController.view
    editViewController.nameTextField.text = item.name
    editViewController.seedTextField.text = item.seed > 0 ? "\(item.seed)" : ""
    editViewController.show(self.view)
  }

  func keyboardWillShow(notification: NSNotification) {
    if let dict = notification.userInfo, rect = dict[UIKeyboardFrameEndUserInfoKey]?.CGRectValue, duration = dict[UIKeyboardAnimationDurationUserInfoKey]?.doubleValue {
      self.bottomTableConstraint.constant = rect.height
      UIView.animateWithDuration(duration, animations: {
        self.view.layoutIfNeeded()
      })
    }
  }

  func keyboardWillHide(notification: NSNotification) {
    if let dict = notification.userInfo, duration = dict[UIKeyboardAnimationDurationUserInfoKey]?.doubleValue {
      self.bottomTableConstraint.constant = 0
      UIView.animateWithDuration(duration, animations: {
        self.view.layoutIfNeeded()
      })
    }
  }
}

extension NewRandomizeViewController: UITableViewDelegate, UITableViewDataSource, TwoLineTextWithButtonCellDelegate, InputDataCellDelegate, SubmitCellDelegate {

  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 4
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0: return 2
    case 2: return self.data.count
    default: return 1
    }
  }

  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    switch indexPath.section {
    case 0: return 100
    case 1: return 180
    case 3: return 250
    default: return 40
    }
  }

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    if indexPath.section == 2 {
      self.showEditRowView(index: indexPath.row)
    }
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCellWithIdentifier("TwoLineTextWithButtonCell") as! TwoLineTextWithButtonCell
      if indexPath.row == 0 {
        cell.titleLabel.text = "Randomize by:"
        cell.button.setTitle(self.gameType.title(), forState: .Normal)
      } else {
        cell.button.setTitle(self.categorizeType.title(), forState: .Normal)
        cell.titleLabel.text = "Categorize by:"
      }
      cell.delegate = self
      return cell
    } else if indexPath.section == 1 {
      let cell = tableView.dequeueReusableCellWithIdentifier("InputDataCell") as! InputDataCell
      cell.delegate = self
      return cell
    } else if indexPath.section == 2 {
      let cell = tableView.dequeueReusableCellWithIdentifier("DataCell") as! DataCell
      let item = data[indexPath.row]
        cell.nameLabel.text = item.name
        cell.seedLabel.text = item.seedString()
      return cell
    } else if indexPath.section == 3 {
      let cell = tableView.dequeueReusableCellWithIdentifier("SubmitCell") as! SubmitCell
      cell.participantsLabel.text = "\(self.data.count) participants"
      cell.delegate = self
      return cell
    }
    return UITableViewCell()
  }

  func cell(cell: TwoLineTextWithButtonCell, buttonClicked button: UIButton) {
    if let indexPath = tableView.indexPathForCell(cell) {
      if indexPath.section == 0 {
        if indexPath.row == 0 {
          self.showRandomizeActionSheet(cell: cell)
        } else {
          self.showCategorizeActionSheet(cell: cell)
        }
      }
    }
  }

  func cellAddButtonClicked(cell: InputDataCell) {
    if let name = cell.nameTextField.text, seed = cell.seedTextField.text where name.characters.count > 0 {
      for player in self.data {
        if player.name == name {
          UIAlertView(title: "Error", message: "Name is exist!", delegate: nil, cancelButtonTitle: "OK").show()
          return
        }
      }
      let player = Player()
      player.id = Player.nextId()
      player.name = name
      player.seed = Int(seed) ?? 0
      player.write()
      self.data.append(player)
      self.tableView.reloadData()
    }
  }

  func cellDidSubmit(cell cell: SubmitCell) {
    print(cell.numberOfTeamTextField.text)
    self.numberOfTeams = Int(cell.numberOfTeamTextField.text!) ?? 1
    let result = RandomizerService.random(self.data, numberOfTeams: self.numberOfTeams)
    let controller = ResultViewController.instantiateStoryboard()
    controller.data = result
    self.navigationController?.pushViewController(controller, animated: true)
  }
}

extension NewRandomizeViewController {
  func editDataViewController(controller: EditDataViewController, clickedSaveButton: UIButton) {
    if let name = controller.nameTextField.text, seed = controller.seedTextField.text, indexPath = tableView.indexPathForSelectedRow {
      let player = self.data[indexPath.row]
      player.update({ () -> Void in
        player.name = name
        player.seed = Int(seed) ?? 0
        }, completion: { [weak self] in
          self?.tableView.reloadData()
      })
    }
  }

  func editDataViewController(controller: EditDataViewController, clickedDeleteButton: UIButton) {
    if let indexPath = self.tableView.indexPathForSelectedRow {
      self.data.removeAtIndex(indexPath.row)
      self.tableView.reloadData()
    }

  }
}