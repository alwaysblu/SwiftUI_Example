//
//  FirstModalReducer.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture

typealias FirstModalReducer = Reducer<
  FirstModalState,
  FirstModalAction,
  FirstModalEnvironment
>

extension FirstModalReducer {
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
