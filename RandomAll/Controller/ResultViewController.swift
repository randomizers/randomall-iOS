//
//  ResultViewController.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit

class ResultViewController: BaseViewController, SaveResultViewControllerDelegate {
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var resultNameLabel: UILabel!
  @IBOutlet weak var saveButton: BlueTypeButton!
  @IBOutlet weak var reuseButton: BlueTypeButton!
  @IBOutlet weak var editButton: RoundButton!
  @IBOutlet weak var deleteButton: RoundButton!

  let saveResultController = SaveResultViewController()

  var data = RandomResult()

  class func instantiateStoryboard() -> ResultViewController {
    return Helper.Storyboard.main().instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    saveResultController.delegate = self
    tableView.registerNib(UINib(nibName: "DataCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "DataCell")
    tableView.delegate = self
    tableView.dataSource = self
    resultNameLabel.text = data.displayName()
    setupUI()
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    let show = self.data.id == 0
    reuseButton.hidden = show
    deleteButton.hidden = show
    saveButton.hidden = !show
    editButton.hidden = !show
  }

  @IBAction func saveButtonClicked(sender: UIButton) {
    saveResultController.show(self.view)
  }

  @IBAction func reuseButtonClicked(sender: UIButton) {
    let controller = NewRandomizeViewController.instantiateStoryboard()
    controller.gameType = self.data.gameType()
    controller.categorizeType = self.data.categorizeType()
    controller.data = self.data.players()
    self.navigationController?.pushViewController(controller, animated: true)
  }

  @IBAction func editButtonClicked(sender: UIButton) {
    self.navigationController?.popViewControllerAnimated(true)
  }

  @IBAction func deleteButtonClicked(sender: UIButton) {
    self.navigationController?.popToRootViewControllerAnimated(true)
    self.data.delete()
  }

  func saveResult(name name:String) {
    if data.id == 0 {
      data.id = RandomResult.nextId()
      data.name = name
      data.write()
      resultNameLabel.text = data.name
    }
  }
}

extension ResultViewController: UITableViewDelegate, UITableViewDataSource {

  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return self.data.teams.count
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.data.teams[section].players.count
  }

  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 30
  }

  func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    cell.alpha = 0
    var position = 0 + indexPath.row + 1
    var s = indexPath.section
    while s > 0 {
      s--
      position += self.data.teams[s].players.count
    }
    let duration = 0.2
    let delay = (duration - 0.05) * Double(position - 1 )
    UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
      cell.alpha = 1
      }, completion: nil)
  }

  func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    var frame = CGRect(x: 0, y: 0, width: 100, height: 20)
    let headerView = UIView(frame: frame)
    headerView.backgroundColor = UIColor.clearColor()
    frame.origin.x += 10
    frame.size.width -= 10
    let label = UILabel(frame: frame)
    label.autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleWidth]
    headerView .addSubview(label)
    label.text = self.data.gameType() == .Groups ? "Group \(section + 1)" : "Team \(section + 1)"
    label.font = UIFont.systemFontOfSize(20)
    label.textColor = UIColor.whiteColor()
    return headerView
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("DataCell") as! DataCell
    let team = self.data.teams[indexPath.section]
    let player = team.players[indexPath.row]
    cell.nameLabel.text = player.name
    cell.seedLabel.text = player.seedString()
    return cell
  }
}

extension ResultViewController {
  func saveResultViewController(controller: SaveResultViewController, clickedSaveButton: UIButton) {
    self.saveResult(name: controller.nameTextField.text!)
    UIAlertView(title: "Save!", message: nil, delegate: nil, cancelButtonTitle: "OK").show()
  }
}