//
//  ZeroView.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture
import SwiftUI

// MARK: View

struct ZeroView: View {

  @ObservedObject
  private var viewStore: ZeroViewStore

  private let store: ZeroStore

  init(store: ZeroStore) {
    self.viewStore = ViewStore(store)
    self.store = store
  }

  var body: some View {
    NavigationView {
      contentView
    }
  }

  var contentView: some View {
    ZStack {
      Color.red
        .ignoresSafeArea()
      NavigationLink(
        isActive: viewStore.binding(\.$nextShowable),
        destination: {
          nextView
        },
        label: {
          Button("show next view") {
            viewStore.send(.setNextShowable(true))
          }
        }
      )
    }.onAppear {
      viewStore.send(.onAppear)
    }.onDisappear {
      viewStore.send(.setNavigationFlag)
    }
  }

  var nextView: some View {
    FirstView(
      store:
          .init(
            initialState: FirstState(),
            reducer: .init(),
            environment: FirstEnvironment()
          )
    )
  }
}

// MARK: Store

typealias ZeroStore = Store<
  ZeroState,
  ZeroAction
>

// MARK: ViewStore

typealias ZeroViewStore = ViewStore<
  ZeroState,
  ZeroAction
>

// MARK: Preview

struct ZeroView_Previews: PreviewProvider {

  static var previews: some View {
    ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
      ZeroView(store: store)
        .preferredColorScheme(colorScheme)
        .previewLayout(.sizeThatFits)
    }
  }

  static let store: ZeroStore = .init(
    initialState: .init(),
    reducer: .init(),
    environment: .init()
  )
}
