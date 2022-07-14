//
//  FirstAction.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture

enum FirstAction: Equatable, BindableAction {
  case secondAction(SecondAction)
  case modalAction(FirstModalAction)
  case binding(BindingAction<FirstState>)
  case toggle
  case onAppear
}
