//
//  NotificationHandler.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/19.
//

import SwiftUI

final class NotificationHandler {
  private let yellowContent: UNMutableNotificationContent = {
    let content = UNMutableNotificationContent()
    content.title = "Hi there"
    content.body = "This is the letter from England..."
    content.userInfo = ["target_view" : "brown_view"]
    content.badge = 1

    return content
  }()

  private lazy var yellowRequests = triggers.map { trigger in
    UNNotificationRequest(
      identifier: UUID().uuidString,
      content: yellowContent,
      trigger: trigger
    )
  }

  private let triggers = [
    UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(1),repeats: false),
    UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(2),repeats: false),
    UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(3),repeats: false),
  ]

  private let notificationCenter: UNUserNotificationCenter = {
    let center = UNUserNotificationCenter.current()

    center.getNotificationSettings { settings in
      guard (settings.authorizationStatus == .authorized) ||
              (settings.authorizationStatus == .provisional) else {
        return
      }

      if settings.alertSetting == .enabled {
        // Schedule an alert-only notification.
      } else {
        // Schedule a notification with a badge and sound.
      }
    }

    return center
  }()

  func push() {
    yellowRequests.forEach { request in
      notificationCenter.add(request, withCompletionHandler: nil)
    }
  }
}
