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
  var first: FirstState
  var path: NavigationPath?

  init(
    first: FirstState = .init(),
    nextShowable: Bool = false,
    path: NavigationPath? = nil
  ) {
    self.nextShowable = nextShowable
    self.first = first
    self.path = path
  }
}
