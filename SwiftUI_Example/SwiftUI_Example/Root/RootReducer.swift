//
//  RootReducer.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture
import Combine

typealias RootReducer = Reducer<
  RootState,
  RootAction,
  RootEnvironment
>

extension RootReducer {
  init() {
    self = Self
      .combine(
        FirstReducer()
          .pullback(
            state: \RootState.first,
            action: /RootAction.firstAction,
            environment: { _ in
              FirstEnvironment()
            }
          ),
        .init { state, action, environment in
          switch action {
          case .onAppear:
            guard state.path == nil else {
              return .none
            }
            return .init(value: .setShowables)

          case .setNextShowable(let nextShowable):
            state.nextShowable = nextShowable
            return .none

          case .firstAction:
            return .none

          case .binding:
            return .none

          case .route(let path):
            state = environment.pathHandler.getRootState(path)
            state.path = path
            return .init(value: RootAction.setShowables)
              .delay(for: delayTime, scheduler: DispatchQueue.main)
              .eraseToEffect()

          case .setShowables:
            if let setter = state.nextShowableSetter {
              state.nextShowable = setter
              state.nextShowableSetter = nil
            }
            if state.path == nil {
              state.nextShowable = false
            } else {
              state.path = nil
            }
            return .none
          }
        }
      ).debug()
  }
}
