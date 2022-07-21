//
//  CartReducer.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/06.
//

import Combine
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
        NavigationReducer<KeyPath<SecondState, Bool>>()
          .make()
          .pullback(
            state: \.navState,
            action: /SecondAction.navigationAction,
            environment: { _ in
              NavigationEnvironment()
            }
          ),
        .init { state, action, environment in
          switch action {
          case .onAppear:
            return .none

          case .setModalShowable(let modalShowable):
            state.modalShowable = modalShowable
            return .none

          case .binding:
            return .none

          case .navigationAction:
            return .none
          }
        }
      )
      .binding()
  }
}
