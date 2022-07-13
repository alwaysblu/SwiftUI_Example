//
//  CartReducer.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/06.
//

import ComposableArchitecture

typealias SecondReducer = Reducer<
  SecondState,
  SecondAction,
  SecondEnvironment
>

extension SecondReducer {
  init() {
    self = Self
      .combine(
        .init { state, action, environment in
          switch action {
          case .toggle :
            state.webViewShowable.toggle()
            return .none

          case .binding:
            return .none
          }
        }
      )
      .binding()
      .debug()
  }
}
