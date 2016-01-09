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

  class func findOrNewByPrimaryKey(value: AnyObject, primaryKey: String = "id") -> Self {
    if let item = try! Realm().objectForPrimaryKey(self, key: value) {
      return item
    }
    let item = self.init()
    item.setValue(value, forKeyPath: primaryKey)
    return item
  }

  class func findOrCreateByPrimaryKey(value: AnyObject, primaryKey: String = "id") -> Self {
    let item = findOrNewByPrimaryKey(value, primaryKey: primaryKey)
    item.write()
    return item
  }

  class func objectForPrimaryKey(value: AnyObject) -> Self? {
    do {
      return try Realm().objectForPrimaryKey(self, key: value)
    } catch {
      return nil
    }
  }

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
}
