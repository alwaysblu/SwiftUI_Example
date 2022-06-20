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
            let window = UIWindow(frame: UIScreen.main.bounds)
            let dimView = UIView()

            dimView.frame = window.frame
            dimView.center = window.center
            dimView.backgroundColor = .black
            dimView.alpha = 0.5

            UIApplication.shared.windows.first?.addSubview(dimView)
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

            dateFormatter.dateFormat = "yyyy"
            state.year = Int(dateFormatter.string(from: state.date)) ?? 1
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
