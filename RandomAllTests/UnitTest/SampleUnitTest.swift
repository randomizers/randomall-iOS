//
//  SampleUnitTest.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import Quick
import Nimble

class SampleUnitTest: BaseSpec {
  override func spec() {
    describe("pass test") {
      it("should pass") {
        expect(1).to(equal(1))
      }
    }
  }
}
