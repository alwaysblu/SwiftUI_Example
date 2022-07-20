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
      return makeGreenPath(delayTime: 250)

    case .purple:
      return makePurplePath(delayTime: 250)

    case .modalGreen:
      return makeModalGreenPath(delayTime: 500)

    case .modalGreenWebView:
      return makeModalGreenWebView(delayTime: 750)
    }
  }

  private func makeGreenPath(delayTime: Int) -> RootState {
    RootState(
      first: .init(
        nextShowableSetter: true,
        delayTime: delayTime
      ),
      nextShowableSetter: true,
      delayTime: delayTime
   )
  }

  private func makePurplePath(delayTime: Int) -> RootState {
    RootState(
      nextShowableSetter: true,
      delayTime: delayTime
    )
  }

  private func makeModalGreenPath(delayTime: Int) -> RootState {
    RootState(
      first: .init(
        modal: .init(
          nextShowableSetter: true,
          delayTime: delayTime
        ),
        modalShowableSetter: true,
        delayTime: delayTime
      ),
      nextShowableSetter: true,
      delayTime: delayTime
    )
  }

  private func makeModalGreenWebView(delayTime: Int) -> RootState {
    RootState(
      first: .init(
        modal: .init(
          second:.init(
            modalShowableSetter: true,
            delayTime: delayTime
          ),
          nextShowableSetter: true,
          delayTime: delayTime
        ),
        modalShowableSetter: true,
        delayTime: delayTime
      ),
      nextShowableSetter: true,
      delayTime: delayTime
    )
  }
}
