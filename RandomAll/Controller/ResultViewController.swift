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

  let saveResultController = SaveResultViewController()

  var data = RandomResult()

  class func instantiateStoryboard() -> ResultViewController {
    return Helper.Storyboard.main().instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    saveResultController.delegate = self
    tableView.registerNib(UINib(nibName: "ResultCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "ResultCell")
    tableView.delegate = self
    tableView.dataSource = self
    setupUI()
  }

  override func setupUI() {
    super.setupUI()
    var frame = CGRect(x: 0, y: 0, width: 100, height: 40)
    let tableHeaderView = UIView(frame: frame)
    tableHeaderView.backgroundColor = UIColor.clearColor()
    frame.origin.x += 10
    frame.size.width -= 10
    let label = UILabel(frame: frame)
    label.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
    tableHeaderView.addSubview(label)
    label.text = "Teams"
    label.font = UIFont.systemFontOfSize(30)
    label.textColor = UIColor.whiteColor()
    tableView.tableHeaderView = tableHeaderView
  }

  @IBAction func saveButtonClicked(sender: UIButton) {
    saveResultController.show(self.view)
  }

  @IBAction func editButtonClicked(sender: UIButton) {
    self.navigationController?.popViewControllerAnimated(true)
  }

  func saveResult(name name:String) {
    if data.id == 0 {
      data.id = RandomResult.nextId()
      data.name = name
      data.write()
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

  func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    var frame = CGRect(x: 0, y: 0, width: 100, height: 20)
    let headerView = UIView(frame: frame)
    headerView.backgroundColor = UIColor.clearColor()
    frame.origin.x += 10
    frame.size.width -= 10
    let label = UILabel(frame: frame)
    label.autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleWidth]
    headerView .addSubview(label)
    label.text = "Team \(section + 1)"
    label.font = UIFont.systemFontOfSize(20)
    label.textColor = UIColor.whiteColor()
    return headerView
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ResultCell") as! ResultCell
    let team = self.data.teams[indexPath.section]
    let player = team.players[indexPath.row]
    cell.nameLabel.text = player.name
    return cell
  }
}

extension ResultViewController {
  func saveResultViewController(controller: SaveResultViewController, clickedSaveButton: UIButton) {
    self.saveResult(name: controller.nameTextField.text!)
    UIAlertView(title: "Save!", message: nil, delegate: nil, cancelButtonTitle: "OK").show()
  }
}