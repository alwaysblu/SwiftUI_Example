//
//  RootState.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture
import Combine

struct RootState: Equatable {
  var navState: NavigationState<KeyPath<FirstState, Bool>> {
    didSet {
      nextShowable = navState.showableStates[\.nextShowable] ?? false
      navState.showableStates[\.nextShowable] = nil
    }
  }
  @BindableState var nextShowable: Bool
  @AlwaysEquatable var first: FirstState
  var path: NavigationPath?

  init(
    navState: NavigationState<KeyPath<FirstState, Bool>> = .init(),
    nextShowable: Bool = false,
    first: FirstState = .init(),
    path: NavigationPath? = nil
  ) {
    self.navState = navState
    self.nextShowable = nextShowable
    self.first = first
    self.path = path
  }
}
