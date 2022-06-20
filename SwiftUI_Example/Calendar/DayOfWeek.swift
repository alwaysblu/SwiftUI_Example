//
//  DayOfWeek.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/06/20.
//

import Foundation

enum DayOfWeek: CaseIterable, CustomStringConvertible {
  case sunday
  case monday
  case tuesday
  case wednsday
  case thursday
  case friday
  case saturday
}

extension DayOfWeek {
  var description: String {
    switch self {
    case .sunday:
      return "일"

    case .monday:
      return "월"

    case .tuesday:
      return "화"

    case .wednsday:
      return "수"

    case .thursday:
      return "목"

    case .friday:
      return "금"

    case .saturday:
      return "토"
    }
  }
}
