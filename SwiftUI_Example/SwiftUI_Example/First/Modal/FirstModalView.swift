//
//  FirstModalView.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture
import SwiftUI

// MARK: View

struct FirstModalView: View {
  
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
        Color.yellow
          .ignoresSafeArea()
        NavigationLink(
          destination:
            SecondView(
              store:
                store.scope(
                  state: \FirstModalState.second,
                  action: FirstModalAction.secondAction
                )
            )
        ) {
          Text("next")
        }
      }
    }
  }
}

// MARK: Store

typealias FirstModalStore = Store<
  FirstModalState,
  FirstModalAction
>

// MARK: ViewStore

typealias FirstModalViewStore = ViewStore<
  FirstModalState,
  FirstModalAction
>

// MARK: Preview

struct FirstModalView_Previews: PreviewProvider {
  
  static var previews: some View {
    ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
      FirstModalView(store: store)
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
