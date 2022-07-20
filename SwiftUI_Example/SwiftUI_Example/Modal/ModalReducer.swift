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
        .init { state, action, environment in
          switch action {
          case .onAppear:
            return Just(state.id)
              .delay(for: delayTime, scheduler: DispatchQueue.main)
              .catchToEffect(ModalAction.setShowables)

          case.secondAction:
            return .none

          case .setNextShowable(let nextShowable):
            state.nextShowable = nextShowable
            return .none

          case .binding:
            return .none

          case .setShowables(.success(let id)):
            guard state.id == id else {
              return .none
            }
            if let setter = state.nextShowableSetter {
              state.nextShowable = setter
              state.nextShowableSetter = nil
            }
            return .none
          }
        }
      ).binding()
  }
}
