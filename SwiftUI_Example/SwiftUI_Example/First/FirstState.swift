//
//  FirstState.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture
import SwiftUI

struct FirstState: Equatable {
  @BindableState var nextShowable: Bool//추가됨@@@@@@@@@@@
  @BindableState var modalShowable: Bool
  var navigationFlag: Bool
  var second: SecondState
  var modal: FirstModalState

  init(
    nextShowable: Bool = false,//추가됨@@@@@@@@@@@
    modalShowable: Bool = false,
    second: SecondState = .init(),
    modal: FirstModalState = .init(),
    navigationFlag: Bool = false
  ) {
    self.modalShowable = modalShowable
    self.nextShowable = nextShowable//추가됨@@@@@@@@@@@
    self.second = second
    self.modal = modal
    self.navigationFlag = navigationFlag
    self.second.navigationFlag = navigationFlag
  }

// MARK: Local FCM

  let yellowContent: UNMutableNotificationContent = {
    let content = UNMutableNotificationContent()
    content.title = "Hi there"
    content.body = "This is the letter from England..."
    content.userInfo = ["target_view" : "brown_view"]
    content.badge = 1

    return content
  }()

  lazy var yellowRequests = triggers.map { trigger in
    UNNotificationRequest(
      identifier: UUID().uuidString,
      content: yellowContent,
      trigger: trigger
    )
  }

  let triggers = [
    UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(3),repeats: false),
    UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(6),repeats: false),
    UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(9),repeats: false),
  ]

  let notificationCenter: UNUserNotificationCenter = {
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
}
