//
//  Date.swift
//  FITpin
//
//  Created by East Agile on 9/3/15.
//  Copyright (c) 2015 fitpin. All rights reserved.
//

import UIKit

extension Helper {
  class Date {
    static let DEFAULT_FORMAT = "yyyy-MM-dd HH:mm:ss Z"
    static let TIME_FORMAT = "hh:mm a"
    static let SHORT_TIME_FORMAT = "h:mm a"
    static let SHORT_DATE_FORMAT = "M/d"
    static let DISPLAY_DATE_FORMAT = "MMMM d%@, yyyy"
    static let FULL_DAY_OF_WEEK_FORMAT = "cccc"
    static let SHORT_DAY_OF_WEEK_FORMAT = "ccc"

    class func toString(date: NSDate, format: String = DEFAULT_FORMAT) -> String {
      let dateFormatter = NSDateFormatter()
      dateFormatter.dateFormat = format
      return dateFormatter.stringFromDate(date)
    }

    class func fromString(string: String,format: String = DEFAULT_FORMAT) -> NSDate? {
      let dateFormatter = NSDateFormatter()
      dateFormatter.dateFormat = format
      return dateFormatter.dateFromString(string)
    }

    class func ordinalDateString(date: NSDate, format: String = DISPLAY_DATE_FORMAT) -> String {
      let dateFormatter = NSDateFormatter()
      dateFormatter.dateFormat = "d"
      let date_day = Int(dateFormatter.stringFromDate(date))!
      dateFormatter.dateFormat = format
      let prefixDateString = dateFormatter.stringFromDate(date)
      let suffix_string = "|st|nd|rd|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|st|nd|rd|th|th|th|th|th|th|th|st"
      let suffixes = suffix_string.componentsSeparatedByString("|")
      let suffix = suffixes[date_day]
      let dateString = String(format: prefixDateString, suffix)
      return dateString
    }
  }
}
