//
//  RootState.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture
import SwiftUI

struct RootState: Equatable {
  @BindableState var nextShowable: Bool
  @AlwaysEquatable var first: FirstState
  var path: NavigationPath?
  var nextShowableSetter: Bool?

  init(
    nextShowable: Bool = false,
    first: FirstState = .init(),
    path: NavigationPath? = nil,
    nextShowableSetter: Bool? = nil
  ) {
    self.nextShowable = nextShowable
    self.first = first
    self.path = path
    self.nextShowableSetter = nextShowableSetter
  }
}
