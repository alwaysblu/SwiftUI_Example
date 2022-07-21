//
//  FirstState.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture
import SwiftUI

struct FirstState: Equatable {
  var navState: NavigationState<KeyPath<FirstState, Bool>> {
    didSet {
      nextShowable = navState.showableStates[\.nextShowable] ?? false
      modalShowable = navState.showableStates[\.modalShowable] ?? false
      navState.showableStates[\.nextShowable] = nil
      navState.showableStates[\.modalShowable] = nil
    }
  }
  var second: SecondState
  var modal: ModalState
  @BindableState var nextShowable: Bool
  @BindableState var modalShowable: Bool

  init(
    navState: NavigationState<KeyPath<FirstState, Bool>> = .init(),
    nextShowable: Bool = false,
    modalShowable: Bool = false,
    second: SecondState = .init(),
    modal: ModalState = .init()
  ) {
    self.navState = navState
    self.modalShowable = modalShowable
    self.nextShowable = nextShowable
    self.second = second
    self.modal = modal
  }
}
