//
//  ZeroReducer.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture
import Combine

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
          case .onAppear:

            return .concatenate(
              .init(value: .setNextShowable(false)),
              .init(value: .route),
              .init(value: .setNavigationFlag)
            )

          case .setNextShowable(let nextShowable):
            state.nextShowable = nextShowable
            return .none

          case .firstAction(_):
            return .none

          case .binding:
            return .none

          case .popAll(let path):
            state = .init()
            state.path = path
            return .none

          case .setNavigationFlag:
            if state.navigationFlag {
              state.navigationFlag = false
            }
            return .none

          case .route:
            guard let path = state.path else {
              return .none
            }
            switch path {
            case .purple:
              state = ZeroState(
                nextShowable: true,
                navigationFlag: true
              )

            case .green:
              state = ZeroState(
                first: .init(
                  nextShowable: true
                ),
                nextShowable: true,
                navigationFlag: true
              )
            }
            state.path = nil
            return .none
          }
        }
      ).debug()
  }
}
