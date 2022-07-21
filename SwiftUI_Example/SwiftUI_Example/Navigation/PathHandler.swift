//
//  PathHandler.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/19.
//

import Foundation

struct PathHandler {
  private let delayTime = 50

  func getRootState(_ path: NavigationPath) -> RootState {
    switch path {
    case .green:
      return makeGreenPath(delayTime: delayTime)
    case .purple:
      return makePurplePath(delayTime: delayTime)

    case .modalGreen:
      return makeModalGreenPath(delayTime: delayTime)

    case .modalGreenWebView:
      return makeModalGreenWebView(delayTime: delayTime)
    }
  }

  private func makeGreenPath(delayTime: Int) -> RootState {
    RootState(
      navState: .init(
        showableSetters: [\.nextShowable: true],
        delayTime: delayTime
      ),
      first: .init(
        navState: .init(
          showableSetters: [\.nextShowable: true],
          delayTime: delayTime
        )
      )
    )
  }

  private func makePurplePath(delayTime: Int) -> RootState {
    RootState(
      navState: .init(
        showableSetters: [\.nextShowable: true],
        delayTime: delayTime
      )
    )
  }

  private func makeModalGreenPath(delayTime: Int) -> RootState {
    RootState(
      navState: .init(
        showableSetters: [\.nextShowable: true],
        delayTime: delayTime
      ),
      first: .init(
        navState: .init(
          showableSetters: [\.modalShowable: true],
          delayTime: delayTime
        ),
        modal: .init(
          nextShowableSetter: true,
          delayTime: delayTime
        )
      )
    )
  }

  private func makeModalGreenWebView(delayTime: Int) -> RootState {
    RootState(
      navState: .init(
        showableSetters: [\.nextShowable: true],
        delayTime: delayTime
      ),
      first: .init(
        navState: .init(
          showableSetters: [\.modalShowable: true],
          delayTime: delayTime
        ),
        modal: .init(
          second:.init(
            navState: .init(
              showableSetters: [\.modalShowable: true],
              delayTime: delayTime
            )
          ),
          nextShowableSetter: true,
          delayTime: delayTime
        )
      )
    )
  }
}
