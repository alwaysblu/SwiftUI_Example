//
//  RootState.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture
import Combine
import SwiftUI

struct RootState: Equatable {
  @BindableState var nextShowable: Bool
  @AlwaysEquatable var first: FirstState
  var path: NavigationPath?
  var nextShowableSetter: Bool?
  var id: UUID

  init(
    nextShowable: Bool = false,
    first: FirstState = .init(),
    path: NavigationPath? = nil,
    nextShowableSetter: Bool? = nil,
    id: UUID = .init()
  ) {
    self.nextShowable = nextShowable
    self.first = first
    self.path = path
    self.nextShowableSetter = nextShowableSetter
    self.id = id
  }
}
