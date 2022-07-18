//
//  FirstState.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture
import SwiftUI

struct FirstState: Equatable {
  @BindableState var nextShowable: Bool
  @BindableState var modalShowable: Bool
  var second: SecondState
  var modal: ModalState
  var navigationFlag: Bool

  init(
    nextShowable: Bool = false,
    modalShowable: Bool = false,
    second: SecondState = .init(),
    modal: ModalState = .init(),
    navigationFlag: Bool = false
  ) {
    self.modalShowable = modalShowable
    self.nextShowable = nextShowable
    self.second = second
    self.modal = modal
    self.navigationFlag = navigationFlag
    self.second.navigationFlag = navigationFlag
  }
}
