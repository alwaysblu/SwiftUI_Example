//
//  AppDelegate.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import SwiftUI
import Firebase
import FirebaseMessaging
var delayTime = DispatchQueue.SchedulerTimeType.Stride.milliseconds(750)

class AppDelegate: UIResponder, UIApplicationDelegate {

  var store: ZeroStore?
  var viewStore: ZeroViewStore?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    let store: ZeroStore = .init(
      initialState: .init(),
      reducer: .init(),
      environment: RootEnvironment()
    )
    self.store = store
    self.viewStore = .init(store)

    // MARK: REMOTE Notification 등록
    FirebaseApp.configure()
    
    if #available(iOS 10.0, *) {
      // For iOS 10 display notification (sent via APNS)
      UNUserNotificationCenter.current().delegate = self

      let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
      UNUserNotificationCenter.current().requestAuthorization(
        options: authOptions,
        completionHandler: { _, _ in }
      )
    } else {
      let settings: UIUserNotificationSettings =
        UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
      application.registerUserNotificationSettings(settings)
    }

    application.registerForRemoteNotifications()

    /// 메세징 대리자 설정
    Messaging.messaging().delegate = self

    /// 푸시 포그라운드 설정
    UNUserNotificationCenter.current().delegate = self

    return true
  }

  // fcm 토큰이 등록되었을 때 파이어베이스 메세징 apnsToken이랑 연결시켜준다.
  func application(
    _ application: UIApplication,
    didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
  ) {
    Messaging.messaging().apnsToken = deviceToken
  }

  // MARK: UISceneSession Lifecycle

  func application(
    _ application: UIApplication,
    configurationForConnecting connectingSceneSession: UISceneSession,
    options: UIScene.ConnectionOptions
  ) -> UISceneConfiguration {
    return UISceneConfiguration(
      name: "Default Configuration",
      sessionRole: connectingSceneSession.role
    )
  }

}

extension AppDelegate: MessagingDelegate {

  // FCM 등록 토큰을 받았을 때
  func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
    print("Firebase registration token: \(String(describing: fcmToken))")

    let dataDict: [String: String] = ["token": fcmToken ?? ""]
    NotificationCenter.default.post(
      name: Notification.Name("FCMToken"),
      object: nil,
      userInfo: dataDict
    )
    // TODO: If necessary send token to application server.
    // Note: This callback is fired at each app startup and whenever a new token is generated.
  }

}

extension AppDelegate: UNUserNotificationCenterDelegate {

  // foreground에서 알림 받기 위해서 필요한 것
  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    let userInfo = notification.request.content.userInfo

    print(userInfo)

    completionHandler([.banner, .badge, .sound])

  }

  // 알림 눌렀을 때 처리
  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    didReceive response: UNNotificationResponse,
    withCompletionHandler completionHandler: @escaping () -> Void
  ) {
    UIView.setAnimationsEnabled(false)
    viewStore?.send(.route(.modalGreenWebView))
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      UIView.setAnimationsEnabled(true)
    }
    print(response.notification.request.content.userInfo)
  }
}
