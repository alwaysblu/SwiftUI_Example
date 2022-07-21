//
//  FirstReducer.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture
import Combine

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
        ModalReducer().pullback(
          state: \FirstState.modal,
          action: /FirstAction.modalAction,
          environment: { _ in
            ModalEnvironment()
          }
        ),
        NavigationReducer<KeyPath<FirstState, Bool>>()
          .make()
          .pullback(
            state: \.navState,
            action: /FirstAction.navigationAction,
            environment: { _ in
              NavigationEnvironment()
            }
          ),
        .init { state, action, environment in
          switch action {
          case .onAppear:
            environment.notificationHandler.push()
            return .none

          case .secondAction:
            return .none

          case .modalAction:
            return .none

          case .binding:
            return .none

          case .setModalShowable(let modalShowable):
            state.modalShowable = modalShowable
            return .none

          case .setNextShowable(let nextShowable):
            state.nextShowable = nextShowable
            return .none

          case .navigationAction:
            return .none
          }
        }
      ).binding()
  }
}
