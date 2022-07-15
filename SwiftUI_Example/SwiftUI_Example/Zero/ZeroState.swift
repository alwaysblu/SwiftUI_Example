//
//  ZeroState.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture

struct ZeroState: Equatable {
  @AlwaysEquatable var first: FirstState
  var flag = true

  init(
    first: FirstState = .init()
  ) {
    self.first = first
  }
}
