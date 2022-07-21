//
//  CartState.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/06.
//

import ComposableArchitecture

struct SecondState: Equatable {
  var navState: NavigationState<KeyPath<SecondState, Bool>> {
    didSet {
      modalShowable = navState.showableStates[\.modalShowable] ?? false
      navState.showableStates[\.modalShowable] = nil
    }
  }
  @BindableState var modalShowable: Bool

  init(
    navState: NavigationState<KeyPath<SecondState, Bool>> = .init(),
    modalShowable: Bool = false
  ) {
    self.navState = navState
    self.modalShowable = modalShowable
  }
}
