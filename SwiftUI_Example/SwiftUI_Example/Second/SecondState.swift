//
//  CartState.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/06.
//

import ComposableArchitecture

struct SecondState: Equatable {
  @BindableState var webViewShowable: Bool
  var navigationFlag: Bool

  init(
    webViewShowable: Bool = false,
    navigationFlag: Bool = false
  ) {
    self.webViewShowable = webViewShowable
    self.navigationFlag = navigationFlag
    }
}
