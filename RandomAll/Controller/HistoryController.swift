//
//  HistoryController.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit

class HistoryController: BaseViewController {
  @IBOutlet weak var tableView: UITableView!
  var data = [RandomResult]()

  class func instantiateStoryboard() -> HistoryController {
    return Helper.Storyboard.main().instantiateViewControllerWithIdentifier("HistoryController") as! HistoryController
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    loadData()
    tableView.registerNib(UINib(nibName: "HistoryCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "HistoryCell")
    tableView.delegate = self
    tableView.dataSource = self
  }

  func loadData() {
    self.data.removeAll()
    self.data.appendContentsOf(RandomResult.all())
  }
}

extension HistoryController: UITableViewDelegate, UITableViewDataSource {

  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.data.count
  }

  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 30
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("HistoryCell") as! HistoryCell
    let result = self.data[indexPath.row]
    cell.nameLabel.text = result.name
    cell.dateLabel.text = Helper.Date.toString(result.createdAt, format: "yyyy-M-d HH:mm")
    return cell
  }

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let result = self.data[indexPath.row]
    let controller = ResultViewController.instantiateStoryboard()
    controller.data = result
    self.navigationController?.pushViewController(controller, animated: true)
  }
}
