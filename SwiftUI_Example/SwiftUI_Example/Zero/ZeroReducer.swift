//
//  ZeroReducer.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture

typealias ZeroReducer = Reducer<
  ZeroState,
  ZeroAction,
  ZeroEnvironment
>

extension ZeroReducer {
  init() {
    self = Self
      .combine(
        FirstReducer()
          .pullback(
            state: \ZeroState.first,
            action: /ZeroAction.firstAction,
            environment: { _ in
              FirstEnvironment()
            }
          ),
        .init { state, action, environment in
          switch action {
          case .firstAction(_):
            return .none
          case .toggle:
            state.flag.toggle()
            return .none
          }
        }
      )
  }
}
