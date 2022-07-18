//
//  FirstModalReducer.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture

typealias ModalReducer = Reducer<
  ModalState,
  ModalAction,
  ModalEnvironment
>

extension ModalReducer {
  init() {
    self = Self
      .combine(
        .init { state, action, environment in
          switch action {
          case.secondAction:
            return .none
          }
        }
      )
  }
}
