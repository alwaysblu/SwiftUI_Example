//
//  CalendarState.swift
//  Foodiverse
//
//  Copyright © 2022 Togi Inc. All rights reserved.
//

import ComposableArchitecture
import CoreGraphics
//import FCommon

public struct CalendarState: Equatable {
  var year: Int
  var month: Int
  var totalGrid: [CalendarDay]
  var currentDay: Int?
  var itemSize: CGSize = .zero
  var isDatePickerShowUp: Bool
  @BindableState var isActive: Bool
  @BindableState var date = Date()

  public init(
    year: Int = Calendar.current.component(.year, from: Date()),
    month: Int = Calendar.current.component(.month, from: Date()),
    totalGrid: [CalendarDay] = [],
    currentDay: Int? = nil,
    itemSize: CGSize = .zero,
    isDatePickerShowUp: Bool = false,
    isActive: Bool = false
  ) {
    let weekday = Calendar.current.component(.weekday, from: Date()) - 1
    let dateComponents = DateComponents(year: year, month: month)
    var numDays = 0
    if let date = Calendar.current.date(
      from: dateComponents
    ),
      let range = Calendar.current.range(
        of: .day,
        in: .month,
        for: date
      ) {
      numDays = range.count
    }

    self.year = year
    self.month = month
    self.totalGrid = Array(1...numDays)
      .map {
        let heartCount = Int.random(in: 0...2)
        return CalendarDay(
          day: $0,
          heartCount: Int.random(in: 0...2),
          isOrderDay: Bool.random(),
          isHeartExist: heartCount == 0
          ? false
          : true,
          cardProgress: Bool.random()
        )
      }
    if weekday != 0 {
      for _ in 1...weekday {
        self.totalGrid
          .insert(
            CalendarDay(
              day: 0,
              heartCount: 0,
              isOrderDay: false,
              isHeartExist: false,
              cardProgress: Bool.random()
            ),
            at: 0
          )
      }
    }

    self.currentDay = currentDay
    self.itemSize = itemSize
    self.isDatePickerShowUp = isDatePickerShowUp
    self.isActive = isActive
  }
}
