//
//  CalendarReducer.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/06/20.
//

import ComposableArchitecture
import CoreGraphics

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
            return .none

          case .setCurrentDay(let currentDay):
            state.currentDay = currentDay
            return .none
          }
        }
      )
  }
}
