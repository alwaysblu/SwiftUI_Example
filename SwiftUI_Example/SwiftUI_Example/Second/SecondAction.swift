//
//  CartAction.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/06.
//

import ComposableArchitecture

enum SecondAction: Equatable, BindableAction {
  case binding(BindingAction<SecondState>)
  case toggle
}
