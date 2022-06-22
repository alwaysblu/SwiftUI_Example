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
  var isDatePickerShowUp: Bool

  init(
    year: Int = Calendar.current.component(.year, from: Date()),
    month: Int = Calendar.current.component(.month, from: Date()),
    totalGrid: [DayInformation] = [],
    currentDay: Int? = nil,
    itemSize: CGSize = .zero,
    isDatePickerShowUp: Bool = false
  ) {
    let weekday = Calendar.current.component(.weekday, from: Date()) - 1
    let dateComponents = DateComponents(year: year, month: month)
    var numDays = 0
    if let date = Calendar.current.date(from: dateComponents),
       let range = Calendar.current.range(of: .day, in: .month, for: date) {
      numDays = range.count
    }

    self.year = year
    self.month = month
    self.totalGrid = Array(1...numDays)
      .map {
        let heartCount = Int.random(in: 0...2)
        return DayInformation(
          day: $0,
          heartCount: Int.random(in: 0...2),
          isOrderDay: Bool.random(),
          isHeartExist: heartCount == 0
          ? false
          : true
        )
      }
    if weekday != 0 {
      for _ in 1...weekday {
        self.totalGrid
          .insert(
            DayInformation(
              day: 0,
              heartCount: 0,
              isOrderDay: false,
              isHeartExist: false
            ),
            at: 0
          )
      }
    }

    self.currentDay = currentDay
    self.itemSize = itemSize
    self.isDatePickerShowUp = isDatePickerShowUp
  }
}
