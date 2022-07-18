//
//  ZeroAction.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture

enum ZeroAction: Equatable, BindableAction {
  case onAppear
  case binding(BindingAction<ZeroState>)
  case setNextShowable(Bool)
  case route
  case popAll(NavigationPath)
  case setNavigationFlag

  case firstAction(FirstAction)
}

enum NavigationPath {
  case green
  case purple
}
