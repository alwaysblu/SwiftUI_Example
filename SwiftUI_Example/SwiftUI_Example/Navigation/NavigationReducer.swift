//
//  NavigationReducer.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/21.
//

import Combine
import ComposableArchitecture
import SwiftUI

struct NavigationReducer<Key> {
  func make() -> Reducer<
    NavigationState<Key>,
    NavigationAction,
    NavigationEnvironment
  > where Key: Hashable {
    .init { state, action, environment in
      switch action {
      case .onAppear:
        return Just(state.id)
          .delay(for: state.delayTime, scheduler: DispatchQueue.main)
          .catchToEffect(NavigationAction.setShowables)

      case .setShowables(.success(let id)):
        guard state.id == id else {
          return .none
        }
        for value in state.showableSetters {
          if let setter = value.value {
            state.showableStates[value.key] = setter
            state.showableSetters[value.key] = nil
          }
        }
        return .none
      }
    }
  }
}
