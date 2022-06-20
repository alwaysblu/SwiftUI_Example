//
//  CalendarReducer.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/06/20.
//

import ComposableArchitecture
import CoreGraphics
import SwiftUI

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
            state.isDatePickerShowUp.toggle()
            return .none

          case .setCurrentDay(let currentDay):
            if state.currentDay != currentDay {
              state.currentDay = currentDay
              return .none
            }

            state.currentDay = nil

            return .none
          case .binding(\.$date):
            let dateFormatter = DateFormatter()

            dateFormatter.dateFormat = "M"
            state.month = Int(dateFormatter.string(from: state.date)) ?? 1
            dateFormatter.dateFormat = "d"
            state.currentDay = Int(dateFormatter.string(from: state.date))

            return .none
          case .binding(_):
            return .none
          }
        }
      )
  }
}
