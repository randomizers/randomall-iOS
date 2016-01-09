import Foundation
import UIKit

class Helper {
  class func env(key: String) -> String? {
    let dict = NSProcessInfo.processInfo().environment
    if dict[key] == nil {
      print("CAN NOT LOAD ENV VAR: \(key)")
    }
    return dict[key]
  }

  class func isTestMode() -> Bool {
    #if DEBUG
      if env("XCInjectBundle") != nil {
        return true
      }
    #endif
    return false
  }

  class func rootViewController() -> UIViewController? {
    return UIApplication.sharedApplication().delegate!.window??.rootViewController
  }
}

func currentApplicationVersion() -> Int {
  let version = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as? String ?? ""
  let build = NSBundle.mainBundle().infoDictionary!["CFBundleVersion"] as? String ?? ""
  var stringVersion = version + build
  stringVersion = stringVersion.stringByReplacingOccurrencesOfString(".", withString: "", options: .LiteralSearch, range: nil)
  return Int(stringVersion) ?? 0
}

func runInMainThread(completion: (() -> Void)) {
  dispatch_async(dispatch_get_main_queue()) {
    completion()
  }
}
