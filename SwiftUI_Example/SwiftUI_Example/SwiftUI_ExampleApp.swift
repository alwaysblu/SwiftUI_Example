//
//  SwiftUI_ExampleApp.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/06/16.
//

import SwiftUI
import Firebase
import FirebaseMessaging

@main
struct SwiftUI_ExampleApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
  var body: some Scene {
    WindowGroup {
      if let store = delegate.store {
        ZeroView(
          store: store
        )
      }
    }
  }
}
