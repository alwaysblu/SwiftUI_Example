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
            state.yellowRequests.forEach { request in
              state.notificationCenter.add(request, withCompletionHandler: nil)
            }
            return .none
          case .secondAction:
            return .none

          case .modalAction:
            return .none

          case .binding:
            return .none

          case .toggleModalShowable:
            state.modalShowable.toggle()
            return .none

          case .toggle:
            state.flag.toggle()
            return .none
          }
        }
      ).binding()
  }
}
