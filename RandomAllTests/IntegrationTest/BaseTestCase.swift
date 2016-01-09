//
//  BaseFeature.swift
//  RandomAll
//
//  Created by EA on 1/9/16.
//  Copyright (c) 2016 randomall. All rights reserved.
//

import Foundation
@testable import RandomAll
import KIF
import Nimble
import RealmSwift
import CoreLocation
import SwiftyJSON

class BaseTestCase: KIFTestCase {
  var tester: KIFUITestActor { return tester() }
  var system: KIFSystemTestActor { return system() }

  private func tester(file : String = __FILE__, _ line : Int = __LINE__) -> KIFUITestActor {
    return KIFUITestActor(inFile: file, atLine: line, delegate: self)
  }

  private func system(file : String = __FILE__, _ line : Int = __LINE__) -> KIFSystemTestActor {
    return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
  }


  override func beforeEach() {
    if let controller = UIApplication.sharedApplication().delegate?.window??.rootViewController as? UINavigationController {
      controller.popToRootViewControllerAnimated(false)
      tester.waitForTimeInterval(0.5)
    }
  }

  override func afterEach() {
  }

  override func afterAll() {
    tester.waitForTimeInterval(1)
  }
}