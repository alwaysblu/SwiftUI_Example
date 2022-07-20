//
//  CartState.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/06.
//

import ComposableArchitecture

struct SecondState: Equatable {
  @BindableState var modalShowable: Bool
  var modalShowableSetter: Bool?
  var id: UUID

  init(
    modalShowable: Bool = false,
    modalShowableSetter: Bool? = nil,
    id: UUID = UUID()
  ) {
    self.modalShowable = modalShowable
    self.modalShowableSetter = modalShowableSetter
    self.id = id
  }
}
