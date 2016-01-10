
import UIKit
import Quick
import Nimble
@testable import RandomAll

class ArrayListSpec: BaseSpec {

  var list: [Int] {
    return [5,2,3,4]
  }

  override func spec() {
    describe("#count") {
      let object = ArrayList<Int>()
      object.appendContentsOf([5,2,3,4])
      it("returns correct number of elements") {
        expect(object.count).to(equal(self.list.count))
      }
    }

    describe("#first") {
      let object = self.initObject()
      it("returns correct element") {
        expect(object.first!).to(equal(self.list.first!))
      }
    }

    describe("#last") {
      let object = self.initObject()
      it("returns correct element") {
        expect(object.last!).to(equal(self.list.last!))
      }
    }

    describe("#removeAll") {
      let object = self.initObject()
      it("returns empty") {
        object.removeAll()
        expect(object).to(beEmpty())
      }
    }

    describe("#subscript") {
      let object = self.initObject()
      it("returns correct element") {
        expect(object[2]).to(equal(self.list[2]))
      }
    }

    describe("#reverse") {
      let object = self.initObject()
      let reverseObject = object.reverse()
      it("returns correct reverse array") {
        for var i = 0; i < reverseObject.count; ++i {
          expect(reverseObject[i]).to(equal(self.list[self.list.count - 1 - i]))
        }
      }
    }

    describe("#decription") {
      let object = self.initObject()
      it("returns correct description") {
        expect(object.description).to(equal("ArrayList: " + self.list.description))
      }
    }
  }

  func initObject() -> ArrayList<Int> {
    let object = ArrayList<Int>()
    object.appendContentsOf(list)
    return object
  }
}
