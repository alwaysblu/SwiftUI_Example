//
//  CalendarState.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/06/20.
//

import ComposableArchitecture
import CoreGraphics

struct CalendarState: Equatable {
  var year: Int
  var month: Int
  var totalGrid: [DayInformation]
  var currentDay: Int?
  var itemSize: CGSize = .zero

  init(
    year: Int = 2022,
    month: Int = 6,
    totalGrid: [DayInformation] = [],
    currentDay: Int? = nil,
    itemSize: CGSize = .zero
  ) {
    self.year = year
    self.month = month
    self.totalGrid = Array(0...30)
      .map {
        DayInformation(
          day: $0,
          heartCount: Int.random(in: 0...2),
          isOrderDay: Bool.random()
        )
      }
    self.currentDay = currentDay
    self.itemSize = itemSize
  }
}
