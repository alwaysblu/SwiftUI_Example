//
//  CalendarAction.swift
//  Foodiverse
//
//  Copyright © 2022 Togi Inc. All rights reserved.
//

import ComposableArchitecture
import CoreGraphics

public enum CalendarAction: Equatable, BindableAction {
  case showDatePickerView
  case setCurrentDay(Int)
  case setItemSize(CGFloat)
  case resetCalendar
  case binding(BindingAction<CalendarState>)
  case setDate
}
