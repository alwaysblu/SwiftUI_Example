//
//  NavigationState.swift
//  SwiftUI_Example
//
//  Created by 최정민 on 2022/07/21.
//

import SwiftUI

struct NavigationState<Key>: Equatable where Key: Hashable {
  var showableSetters: [Key: Bool?]
  var id: UUID
  var delayTime: DispatchQueue.SchedulerTimeType.Stride

  init(
    showableSetters: [Key: Bool?] = [:],
    id: UUID = UUID(),
    delayTime: Int = 50
  ) {
    self.showableSetters = showableSetters
    self.id = id
    self.delayTime = DispatchQueue.SchedulerTimeType.Stride.milliseconds(delayTime)
  }
}

