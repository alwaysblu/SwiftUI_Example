//
//  NavigationState.swift
//  SwiftUI_Example
//
//  Created by 최정민 on 2022/07/21.
//

import Foundation

struct NavigationState<Key>: Equatable where Key: Hashable {
  var showableStates: [Key: Bool]
  var showableSetters: [Key: Bool]
  var id: UUID
  var delayTime: DispatchQueue.SchedulerTimeType.Stride

  init(
    showableStates: [Key: Bool] = [:],
    showableSetters: [Key: Bool] = [:],
    id: UUID = UUID(),
    delayTime: Int = 50
  ) {
    self.showableStates = showableStates
    self.showableSetters = showableSetters
    self.id = id
    self.delayTime = DispatchQueue.SchedulerTimeType.Stride.milliseconds(delayTime)
  }
}
