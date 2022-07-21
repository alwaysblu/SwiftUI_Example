//
//  FirstModalAction.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture

enum ModalAction: Equatable, BindableAction {
  case onAppear
  case binding(BindingAction<ModalState>)
  case secondAction(SecondAction)
  case setNextShowable(Bool)
  case navigationAction(NavigationAction)
}
