//
//  FirstAction.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture

enum FirstAction: Equatable, BindableAction {
  case binding(BindingAction<FirstState>)
  case setNextShowable(Bool)
  case setShowables
  case secondAction(SecondAction)
  case modalAction(ModalAction)
  case setModalShowable(Bool)
  case onAppear
}
