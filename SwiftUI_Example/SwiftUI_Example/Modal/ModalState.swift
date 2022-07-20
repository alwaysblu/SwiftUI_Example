//
//  FirstModalState.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture

struct ModalState: Equatable {
  @BindableState var nextShowable: Bool
  var second: SecondState
  var nextShowableSetter: Bool?
  var id: UUID
  var delayTime: DispatchQueue.SchedulerTimeType.Stride

  init(
    nextShowable: Bool = false,
    second: SecondState = .init(),
    nextShowableSetter: Bool? = nil,
    id: UUID = UUID(),
    delayTime: Int = 50
  ) {
    self.nextShowable = nextShowable
    self.second = second
    self.nextShowableSetter = nextShowableSetter
    self.id = id
    self.delayTime = DispatchQueue.SchedulerTimeType.Stride.milliseconds(delayTime)
  }
}
