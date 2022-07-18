//
//  PathHandler.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/19.
//

import Foundation

struct PathHandler {
  func getRootState(_ path: NavigationPath) -> RootState {
    switch path {
    case .green:
      return makeGreenPath()

    case .purple:
      return makePurplePath()
    }
  }

  private func makeGreenPath() -> RootState {
    RootState(
     first: .init(
       nextShowable: true,
       navigationFlag: true
     ),
     nextShowable: true,
     navigationFlag: true
   )
  }

  private func makePurplePath() -> RootState {
    RootState(
      nextShowable: true,
      navigationFlag: true
    )
  }
}
