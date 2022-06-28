//
//  CalendarReducer.swift
//  Foodiverse
//
//  Copyright © 2022 Togi Inc. All rights reserved.
//

import ComposableArchitecture
import CoreGraphics
//import FCommon
import SwiftUI

public typealias CalendarReducer = Reducer<
  CalendarState,
  CalendarAction,
  CalendarEnvironment
>

extension CalendarReducer {
  // swiftlint:disable function_body_length
  public init() {
    self = Self
      .combine(
        .init { state, action, environment in
          switch action {
          case .setItemSize(let entireWidth) :
            let width = entireWidth / 7
            state.itemSize = CGSize(width: width, height: width)
            return .none

          case .showDatePickerView:
            state.isActive = true
            return .none

          case .setCurrentDay(let currentDay):
            if state.currentDay != currentDay {
              state.currentDay = currentDay
              return .none
            }

            state.currentDay = nil

            return .none

          case .setDate:
            let dateFormatter = DateFormatter()

            dateFormatter.dateFormat = "yyyy"
            state.year = Int(dateFormatter.string(from: state.date)) ?? 1
            dateFormatter.dateFormat = "M"
            state.month = Int(dateFormatter.string(from: state.date)) ?? 1

            return .init(value: CalendarAction.resetCalendar)

          case .resetCalendar:
            let dateComponents = DateComponents(year: state.year, month: state.month)
            guard let date = Calendar.current.date(from: dateComponents) else {
              return .none
            }
            let weekday = Calendar.current.component(.weekday, from: date) - 1
            guard let range = Calendar.current.range(of: .day, in: .month, for: date) else {
              return .none
            }
            let numDays = range.count

            state.currentDay = nil
            state.totalGrid = Array(1...numDays)
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

            guard weekday != 0 else {
              return .none
            }

            for _ in 1...weekday {
              state
                .totalGrid
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
            return .none
            
          case .binding(\.$isActive):
            state.isActive = false
            return .none

          case .binding:
            return .none
          }
        }
      )
      .binding()
  }
}
