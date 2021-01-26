//
//  AppDelegate.swift
//  Samples
//
//  Created by Nguyen Duc Hiep on 11/10/20.
//

import UIKit
import NDManualObjects

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window

    let controller = NDManualViewController()
    controller.view.backgroundColor = .white

    window.rootViewController = controller
    window.makeKeyAndVisible()

    return true
  }

  func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
    let controller = NDManualNavigationController()
    controller.viewDidLoadHandler = { _ in
      print("viewDidLoad")
    }

    controller.wasDismissedHandler = { _ in
      print("wasDismissedHandler")
    }

    window?.rootViewController?.dismiss(animated: true, completion: {
      self.window?.rootViewController?.present(controller, animated: true)
    })
  }
}
