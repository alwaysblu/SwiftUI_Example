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
          case .onAppear:
            if state.navigationFlag {
              return .init(value: .setNavigationFlag)
            }
            return .none

          case .toggle :
            state.modalShowable.toggle()
            return .none

          case .setNavigationFlag:
            if state.navigationFlag {
              state.navigationFlag = false
            }
            return .none

          case .setModalShowable(let modalShowable):
            state.modalShowable = modalShowable
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
