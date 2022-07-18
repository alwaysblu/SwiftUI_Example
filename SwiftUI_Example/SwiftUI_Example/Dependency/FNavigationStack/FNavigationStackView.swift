//
//  FNavigationStackView.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/15.
//

import SwiftUI

public struct FNavigationStackView<Content>: View where Content : View {
  public var body: NavigationView<Content>

  public typealias Body = NavigationView<Content>

  public init(@ViewBuilder content: () -> Content) {
    body = NavigationView(content: content)
  }
}
