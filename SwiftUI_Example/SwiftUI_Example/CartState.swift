//
//  CartState.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/06.
//

import ComposableArchitecture

struct CartState: Equatable {
  @BindableState var flag: Bool = false
  var a: String = ""
  var b: String = ""
}
