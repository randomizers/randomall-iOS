import Foundation
import UIKit

class Helper {
  class func env(key: String) -> String? {
    let dict = NSProcessInfo.processInfo().environment
    if dict[key] == nil {
      bbPrint("CAN NOT LOAD ENV VAR: \(key)")
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

func NSLocalizedString(key: String) -> String {
  return NSLocalizedString(key, comment: "")
}

func delay(delay:Double, closure:()->()) {
  dispatch_after(
    dispatch_time(
      DISPATCH_TIME_NOW,
      Int64(delay * Double(NSEC_PER_SEC))
    ),
    dispatch_get_main_queue(), closure)
}

func clearUserDefaultsObjectForKey(key: String) {
  NSUserDefaults.standardUserDefaults().removeObjectForKey(key)
  NSUserDefaults.standardUserDefaults().synchronize()
}

func getUserDefaultsObjectForKey(key: String) -> AnyObject? {
  return NSUserDefaults.standardUserDefaults().objectForKey(key)
}

func setUserDefaultsObject(object: AnyObject, forKey key: String) {
  NSUserDefaults.standardUserDefaults().setObject(object, forKey: key)
  NSUserDefaults.standardUserDefaults().synchronize()
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

func bbPrint(items: Any..., separator: String = " ", terminator: String = "\n") {
  #if DEBUG
    var idx = items.startIndex
    let endIdx = items.endIndex
    repeat {
      Swift.print(items[idx++], separator: separator, terminator: idx == endIdx ? terminator : separator)
    }
      while idx < endIdx
  #else
  #endif
}
