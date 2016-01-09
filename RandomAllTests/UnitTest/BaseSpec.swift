import RealmSwift
import Quick
import Nimble
@testable import RandomAll
import RealmSwift
import SwiftyJSON
import OHHTTPStubs

class BaseSpec: QuickSpec {
  override func spec() {
    beforeSuite {}

    afterEach {
      OHHTTPStubs.removeAllStubs()
    }
  }
}