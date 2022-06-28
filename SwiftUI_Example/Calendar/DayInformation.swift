//
//  CalendarDay.swift
//  Foodiverse
//
//  Copyright © 2022 Togi Inc. All rights reserved.
//

import Foundation

public struct CalendarDay: Hashable {
  private let id = UUID()
  public let day: Int
  public let heartCount: Int
  public let isOrderDay: Bool
  public let isHeartExist: Bool
  public let cardProgress: Bool

  public init(
    day: Int,
    heartCount: Int,
    isOrderDay: Bool,
    isHeartExist: Bool,
    cardProgress: Bool
  ) {
    self.day = day
    self.heartCount = heartCount
    self.isOrderDay = isOrderDay
    self.isHeartExist = isHeartExist
    self.cardProgress = cardProgress
  }
}
