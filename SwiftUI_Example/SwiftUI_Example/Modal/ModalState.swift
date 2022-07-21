//
//  FirstModalState.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture

struct ModalState: Equatable {
  var navState: NavigationState<KeyPath<ModalState, Bool>> {
    didSet {
      nextShowable = navState.showableStates[\.nextShowable] ?? false
      navState.showableStates[\.nextShowable] = nil
    }
  }
  @BindableState var nextShowable: Bool
  var second: SecondState

  init(
    navState: NavigationState<KeyPath<ModalState, Bool>> = .init(),
    nextShowable: Bool = false,
    second: SecondState = .init()
  ) {
    self.navState = navState
    self.nextShowable = nextShowable
    self.second = second
  }
}
