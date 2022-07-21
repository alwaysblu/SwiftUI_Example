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
        NavigationReducer()
          .make()
          .pullback(
            state: \.navState,
            action: /RootAction.navigationAction,
            environment: { _ in
              NavigationEnvironment()
            }
          ),
        .init { state, action, environment in
          switch action {
          case .onAppear:
            guard state.path == nil else {
              return .none
            }
            return .init(value: .navigationAction(.onAppear))

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

            return .init(value: .navigationAction(.onAppear))

          case .navigationAction:
            return .none
          }
        }
      )
      .debug()
      .binding()
  }
}
