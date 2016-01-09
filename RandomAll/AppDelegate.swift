//
//  AppDelegate.swift
//  RandomAll
//
//  Created by Buu Bui on 1/9/16.
//  Copyright © 2016 East Agile. All rights reserved.
//

import UIKit
import HockeySDK
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    if Helper.isTestMode() {
      print("TEST_MODE")
      Realm.Configuration.defaultConfiguration.path = Helper.Constant.testRealmPath
    } else {
      let newschemaVersion = UInt64(currentApplicationVersion())
      Realm.Configuration.defaultConfiguration.schemaVersion = newschemaVersion
      Realm.Configuration.defaultConfiguration.migrationBlock = { (migration, oldSchemaVersion) in
        if oldSchemaVersion < newschemaVersion {
          NSUserDefaults.standardUserDefaults().synchronize()
        }
      }
      _ = try! Realm()
      print("REALM_PATH: \(Realm.Configuration.defaultConfiguration.path)\n")
    }
    if Helper.Credentials.hockeyAppId != "INVALID_APP_ID" {
      BITHockeyManager.sharedHockeyManager().configureWithIdentifier(Helper.Credentials.hockeyAppId)
      // Do some additional configuration if needed here
      BITHockeyManager.sharedHockeyManager().startManager()
      BITHockeyManager.sharedHockeyManager().authenticator.authenticateInstallation()
    }

    return true
  }
}
