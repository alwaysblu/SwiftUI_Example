//
//  FirstModalView.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture
import SwiftUI

// MARK: View

struct ModalView: View {

  @ObservedObject
  private var viewStore: FirstModalViewStore

  private let store: FirstModalStore

  init(store: FirstModalStore) {
    self.viewStore = ViewStore(store)
    self.store = store
  }

  var body: some View {
    NavigationView {
      ZStack {
        Color.brown
          .ignoresSafeArea()
        NavigationLink(
          destination:
            nextView
        ) {
          Text("next")
        }
      }
    }
  }

  var nextView: some View {
    SecondView(
      store:
        store.scope(
          state: \ModalState.second,
          action: ModalAction.secondAction
        )
    )
  }
}

// MARK: Store

typealias FirstModalStore = Store<
  ModalState,
  ModalAction
>

// MARK: ViewStore

typealias FirstModalViewStore = ViewStore<
  ModalState,
  ModalAction
>

// MARK: Preview

struct FirstModalView_Previews: PreviewProvider {

  static var previews: some View {
    ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
      ModalView(store: store)
        .preferredColorScheme(colorScheme)
        .previewLayout(.sizeThatFits)
    }
  }

  static let store: FirstModalStore = .init(
    initialState: .init(),
    reducer: .init(),
    environment: .init()
  )
}
