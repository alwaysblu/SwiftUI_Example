//
//  File.swift
//  Foodiverse
//
//  Copyright © 2022 Togi Inc. All rights reserved.
//

import Foundation

public enum DayOfWeek: CaseIterable, CustomStringConvertible {
  case sunday
  case monday
  case tuesday
  case wednsday
  case thursday
  case friday
  case saturday
}

extension DayOfWeek {
  public var description: String {
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
