//
//  FirstState.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture

struct FirstState: Equatable {
  @BindableState var flag = false
  var second: SecondState
  var modal: FirstModalState

  init(
    second: SecondState = .init(),
    modal: FirstModalState = .init()
  ) {
    self.second = second
    self.modal = modal
  }
}
