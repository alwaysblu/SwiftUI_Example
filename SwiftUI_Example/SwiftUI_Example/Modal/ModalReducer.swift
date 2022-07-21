//
//  FirstModalReducer.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import Combine
import ComposableArchitecture

typealias ModalReducer = Reducer<
  ModalState,
  ModalAction,
  ModalEnvironment
>

extension ModalReducer {
  init() {
    self = Self
      .combine(
        SecondReducer().pullback(
          state: \.second,
          action: /ModalAction.secondAction,
          environment: { _ in
            SecondEnvironment()
          }
        ),
        NavigationReducer<KeyPath<ModalState, Bool>>()
          .make()
          .pullback(
            state: \.navState,
            action: /ModalAction.navigationAction,
            environment: { _ in
              NavigationEnvironment()
            }
          ),
        .init { state, action, environment in
          switch action {
          case .onAppear:
            return .init(value: .navigationAction(.onAppear))

          case.secondAction:
            return .none

          case .setNextShowable(let nextShowable):
            state.nextShowable = nextShowable
            return .none

          case .binding:
            return .none
            
          case .navigationAction:
            return .none
          }
        }
      ).binding()
  }
}
