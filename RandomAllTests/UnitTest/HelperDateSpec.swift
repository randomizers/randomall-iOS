//
//  HelperDateSpec.swift
//  RandomAll
//
//  Created by Buu Bui on 1/10/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import Quick
import Nimble
@testable import RandomAll

class HelperDateSpec: BaseSpec {

  override func spec() {
    describe("toString") {
      it("should return correct string of date") {
        let date = NSDate(timeIntervalSince1970: 3600)
        expect(Helper.Date.toString(date, format: "yyyy-MM-dd HH:mm:ss")).to(equal("1970-01-01 09:00:00"))
      }
    }
  }
}
