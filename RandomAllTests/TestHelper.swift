
import Foundation
import RealmSwift
@testable import RandomAll

class TestHelper: NSObject {

  class func cleanTestDatabase() {
    let realm = try! Realm()
    try! realm.write {
      realm.deleteAll()
    }
  }

}
