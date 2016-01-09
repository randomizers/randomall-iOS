//
//  Array+Shufle.swift
//  RandomAll
//
//  Created by Buu Bui on 1/10/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit

extension CollectionType {
  /// Return a copy of `self` with its elements shuffled
  func shuffle() -> [Generator.Element] {
    var list = Array(self)
    list.shuffleInPlace()
    return list
  }
}

extension MutableCollectionType where Index == Int {
  /// Shuffle the elements of `self` in-place.
  mutating func shuffleInPlace() {
    // empty and single-element collections don't shuffle
    if count < 2 { return }

    for i in 0..<count - 1 {
      let j = Int(arc4random_uniform(UInt32(count - i))) + i
      guard i != j else { continue }
      swap(&self[i], &self[j])
    }
  }
}

extension Array {
  func splitEvery(nInEach: Int) -> [Array] {
    var result = [Array]()
    var from  = 0
    while from < self.count {
      var to = from + nInEach - 1
      if to > self.count - 1 {
        to = self.count - 1
      }
      result.append(Array(self[from...to ]))
      from = to + 1
    }
    return result
  }
}