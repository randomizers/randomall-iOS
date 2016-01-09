import RealmSwift
import Quick
import Nimble
@testable import RandomAll
import RealmSwift

class BaseSpec: QuickSpec {
  override func spec() {
    beforeEach {
      TestHelper.cleanTestDatabase()
    }

    afterEach {
    }
  }
}