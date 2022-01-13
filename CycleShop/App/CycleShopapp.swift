//
//  CycleShop.swift
//  CycleShop
//
//  Created by Asif Thaha on 03/01/22.
//

import SwiftUI
import Firebase

@main
struct CycleShopapp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}



class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
                   [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
