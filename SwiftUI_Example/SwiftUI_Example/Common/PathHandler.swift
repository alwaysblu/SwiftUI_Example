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

    case .modalGreen:
      return makeModalGreenPath()

    case .modalGreenWebView:
      return makeModalGreenWebView()
    }
  }

  private func makeGreenPath() -> RootState {
    RootState(
      first: .init(
        nextShowableSetter: true
      ),
      nextShowableSetter: true
   )
  }

  private func makePurplePath() -> RootState {
    RootState(
      nextShowableSetter: true
    )
  }

  private func makeModalGreenPath() -> RootState {
    RootState(
      first: .init(
        modal: .init(
          nextShowableSetter: true
        ),
        modalShowableSetter: true
      ),
      nextShowableSetter: true
    )
  }

  private func makeModalGreenWebView() -> RootState {
    RootState(
      first: .init(
        modal: .init(
          second:.init(
            modalShowableSetter: true
          ),
          nextShowableSetter: true
        ),
        modalShowableSetter: true
      ),
      nextShowableSetter: true
    )
  }
}
