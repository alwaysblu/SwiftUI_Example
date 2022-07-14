//
//  ZeroState.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture

struct ZeroState: Equatable {
  var first: FirstState

  init(
    first: FirstState = .init()
  ) {
    self.first = first
  }
}
