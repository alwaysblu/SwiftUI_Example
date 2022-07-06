//
//  CartReducer.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/06.
//

import ComposableArchitecture

typealias CartReducer = Reducer<
  CartState,
  CartAction,
  CartEnvironment
>

extension CartReducer {
  init() {
    self = Self
      .combine(
        .init { state, action, environment in
          switch action {
          case .toggle :
            state.flag.toggle()
            state.a = "ab"
            state.b = "ab"
            return .none
          case .binding:
            return .none
          }
        }
      ).binding()
  }
}
