//
//  FirstReducer.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture

typealias FirstReducer = Reducer<
  FirstState,
  FirstAction,
  FirstEnvironment
>

extension FirstReducer {
  init() {
    self = Self
      .combine(
        SecondReducer().pullback(
          state: \FirstState.second,
          action: /FirstAction.secondAction,
          environment: { _ in
            SecondEnvironment()
          }
        ),
        FirstModalReducer().pullback(
          state: \FirstState.modal,
          action: /FirstAction.modalAction,
          environment: { _ in
            FirstModalEnvironment()
          }
        ),
        .init { state, action, environment in
          switch action {
          case .onAppear:
            if state.navigationFlag {
              return .init(value: .setNavigationFlag)
            }
            state.yellowRequests.forEach { request in
              state.notificationCenter.add(request, withCompletionHandler: nil)
            }
            state.nextShowable = false
            return .none

          case .secondAction:
            return .none

          case .modalAction:
            return .none

          case .setNavigationFlag:
            if state.navigationFlag {
              state.navigationFlag = false
            }
            return .none

          case .binding:
            return .none

          case .toggleModalShowable(let modalShowable):
            state.modalShowable = modalShowable
            return .none

          case .setNextShowable(let nextShowable):
            state.nextShowable = nextShowable
            return .none
          }
        }
      ).binding()
  }
}
