//
//  ArrayList.swift
//  RandomAll
//
//  Created by Buu Bui on 1/10/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

//
//  ArrayList.swift
//  FITpin
//
//  Created by Buu Bui on 10/29/15.
//  Copyright © 2015 fitpin. All rights reserved.
//

import UIKit

class ArrayList<T>: SequenceType, CustomStringConvertible {
  private var list = [T]()

  var count: Int {
    return list.count
  }

  var first: T? {
    return list.first
  }

  var last: T? {
    return list.last
  }

  func append(newElement: T) {
    list.append(newElement)
  }

  func appendContentsOf(newElements: [T]) {
    list.appendContentsOf(newElements)
  }

  func removeAll() {
    list.removeAll()
  }

  func removeFirst() -> T {
    return list.removeFirst()
  }

  func reverse() -> ArrayList<T> {
    let array = ArrayList<T>()
    array.appendContentsOf(list.reverse())
    return array
  }


  subscript(index: Int) -> T {
    get {
      return list[index]
    }
    set(newValue) {
      list[index] = newValue
    }
  }

  func generate() -> AnyGenerator<T> {
    var nextIndex = list.count-1
    return anyGenerator {
      if (nextIndex < 0) {
        return nil
      }
      return self.list[nextIndex--]
    }
  }

  var description: String {
    return "ArrayList: " + list.description
  }
}
