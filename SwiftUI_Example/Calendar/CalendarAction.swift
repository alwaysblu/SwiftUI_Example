//
//  CalendarAction.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/06/20.
//

import CoreGraphics
import ComposableArchitecture

enum CalendarAction: Equatable {
  case showDatePickerView
  case setCurrentDay(Int)
  case setItemSize(CGFloat)
  case setDate(Result<Date, Never>)
}
