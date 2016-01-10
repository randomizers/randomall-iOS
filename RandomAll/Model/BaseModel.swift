//
//  BaseModel.swift
//  FITpin
//
//  Created by East Agile on 8/19/15.
//  Copyright (c) 2015 fitpin. All rights reserved.
//

import UIKit
import RealmSwift

class BaseModel: Object {
  dynamic var id: Int = 0
  func write() {
    let realm = try! Realm()
    try! realm.write {
      realm.add(self, update: true)
    }
  }

  func update(action: (() -> Void), completion: (() -> Void)? ) {
    try! Realm().write {
      action()
    }
    completion?()
  }

  func delete() {
    let realm = try! Realm()
    try! realm.write {
      realm.delete(self)
    }
  }
  class func nextId() -> Int {
    if let item = try! Realm().objects(self).last {
      return item.valueForKey("id") as! Int + 1
    }
    return 1
  }

  override static func primaryKey() -> String? {
    return "id"
  }
}
