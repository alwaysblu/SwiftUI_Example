//
//  PathHandler.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/19.
//

import Foundation

struct PathHandler {
  private let modalDelay = 50
  private let nextDelay = 50

  func getRootState(_ path: NavigationPath) -> RootState {
    switch path {
    case .green:
      return makeGreenPath(modalDelay: modalDelay, nextDelay: nextDelay)

    case .purple:
      return makePurplePath(modalDelay: modalDelay, nextDelay: nextDelay)

    case .modalGreen:
      return makeModalGreenPath(modalDelay: modalDelay, nextDelay: nextDelay)

    case .modalGreenWebView:
      return makeModalGreenWebView(modalDelay: modalDelay, nextDelay: nextDelay)
    }
  }

  private func makeGreenPath(modalDelay: Int, nextDelay: Int) -> RootState {
    RootState(
      first: .init(
        nextShowableSetter: true,
        delayTime: nextDelay
      ),
      nextShowableSetter: true,
      delayTime: nextDelay
   )
  }

  private func makePurplePath(modalDelay: Int, nextDelay: Int) -> RootState {
    RootState(
      nextShowableSetter: true,
      delayTime: nextDelay
    )
  }

  private func makeModalGreenPath(modalDelay: Int, nextDelay: Int) -> RootState {
    RootState(
      first: .init(
        modal: .init(
          nextShowableSetter: true,
          delayTime: nextDelay
        ),
        modalShowableSetter: true,
        delayTime: modalDelay
      ),
      nextShowableSetter: true,
      delayTime: nextDelay
    )
  }

  private func makeModalGreenWebView(modalDelay: Int, nextDelay: Int) -> RootState {
    RootState(
      first: .init(
        modal: .init(
          second:.init(
            modalShowableSetter: true,
            delayTime: modalDelay
          ),
          nextShowableSetter: true,
          delayTime: nextDelay
        ),
        modalShowableSetter: true,
        delayTime: modalDelay
      ),
      nextShowableSetter: true,
      delayTime: nextDelay
    )
  }
}
