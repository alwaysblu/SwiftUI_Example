//
//  CalendarReducer.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/06/20.
//

import ComposableArchitecture
import CoreGraphics
import SwiftUI
import UIKit

typealias CalendarReducer = Reducer<
  CalendarState,
  CalendarAction,
  CalendarEnvironment
>

extension CalendarReducer {
  init() {
    self = Self
      .combine(
        .init { state, action, environment in
          switch action {
          case .setItemSize(let entireWidth) :
            let width = entireWidth / 7
            state.itemSize = CGSize(width: width, height: width)
            return .none

          case .showDatePickerView:
            return environment
              .dimView
              .showDimView()
              .receive(on: environment.scheduler)
              .catchToEffect(CalendarAction.setDate)

          case .setCurrentDay(let currentDay):
            if state.currentDay != currentDay {
              state.currentDay = currentDay
              return .none
            }

            state.currentDay = nil

            return .none
          case .setDate(.success(let date)):
            let dateFormatter = DateFormatter()

            dateFormatter.dateFormat = "yyyy"
            state.year = Int(dateFormatter.string(from: date)) ?? 1
            dateFormatter.dateFormat = "M"
            state.month = Int(dateFormatter.string(from: date)) ?? 1

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
                return DayInformation(
                  day: $0,
                  heartCount: Int.random(in: 0...2),
                  isOrderDay: Bool.random(),
                  isHeartExist: heartCount == 0
                  ? false
                  : true
                )
              }

            guard weekday != 0 else {
              return .none
            }

            for _ in 1...weekday {
              state
                .totalGrid
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

            return .none
          }
        }
      )
  }
}
