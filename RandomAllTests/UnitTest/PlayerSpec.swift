//
//  PlayerSpec.swift
//  RandomAll
//
//  Created by Buu Bui on 1/10/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import Quick
import Nimble
@testable import RandomAll

class PlayerSpec: BaseSpec {

  override func spec() {
    let player = Player()
    describe("seedString") {
      context("seed = 0") {
        it("should return correct seedString") {
          player.seed = 0
          expect(player.seedString()).to(equal(""))
        }
      }
      context("seed > 0") {
        it("should return correct seedString") {
          player.seed = 5
          expect(player.seedString()).to(equal("5"))
        }
      }
    }
  }
}
