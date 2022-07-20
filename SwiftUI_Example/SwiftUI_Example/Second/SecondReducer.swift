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
        .init { state, action, environment in
          switch action {
          case .onAppear:
            return Just(state.id)
                .delay(for: state.delayTime, scheduler: DispatchQueue.main)
                .catchToEffect(SecondAction.setShowables)

          case .setModalShowable(let modalShowable):
            state.modalShowable = modalShowable
            return .none

          case .binding:
            return .none

          case .setShowables(.success(let id)):
            guard state.id == id else {
              return .none
            }
            if let setter = state.modalShowableSetter {
              state.modalShowable = setter
              state.modalShowableSetter = nil
            }
            return .none
            
          }
        }
      )
      .binding()
  }
}
