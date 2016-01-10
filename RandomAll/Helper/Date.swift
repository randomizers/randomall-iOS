
import UIKit

extension Helper {
  class Date {
    class func toString(date: NSDate, format: String) -> String {
      let dateFormatter = NSDateFormatter()
      dateFormatter.dateFormat = format
      return dateFormatter.stringFromDate(date)
    }
  }
}
