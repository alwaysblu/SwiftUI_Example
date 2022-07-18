//
//  CartState.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/06.
//

import ComposableArchitecture

struct SecondState: Equatable {
  @BindableState var modalShowable: Bool
  var navigationFlag: Bool

  init(
    modalShowable: Bool = false,
    navigationFlag: Bool = false
  ) {
    self.modalShowable = modalShowable
    self.navigationFlag = navigationFlag
    }
}
