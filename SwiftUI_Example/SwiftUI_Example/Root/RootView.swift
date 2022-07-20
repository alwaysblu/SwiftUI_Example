//
//  RootView.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture
import SwiftUI

// MARK: View

struct RootView: View {

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
      Color
        .red
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
    }
    .onAppear {
      viewStore.send(.onAppear)
    }
  }

  var nextView: some View {
    FirstView(
      store: store.scope(
        state: \.first,
        action: RootAction.firstAction
      )
    )
  }
}

// MARK: Store

typealias ZeroStore = Store<
  RootState,
  RootAction
>

// MARK: ViewStore

typealias ZeroViewStore = ViewStore<
  RootState,
  RootAction
>

