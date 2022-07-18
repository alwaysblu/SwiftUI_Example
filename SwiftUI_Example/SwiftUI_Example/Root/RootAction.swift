//
//  RootAction.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture

enum RootAction: Equatable, BindableAction {
  case onAppear
  case binding(BindingAction<RootState>)
  case setNextShowable(Bool)
  case route(NavigationPath)

  case firstAction(FirstAction)
}
