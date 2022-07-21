//
//  NavigationAction.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/21.
//

import Foundation

enum NavigationAction: Equatable {
  case setShowables(Result<UUID, Never>)
  case onAppear
}
