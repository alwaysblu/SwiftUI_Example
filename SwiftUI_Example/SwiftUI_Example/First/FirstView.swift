//
//  FirstView.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//

import ComposableArchitecture
import SwiftUI

// MARK: View

struct FirstView: View {

  @ObservedObject
  private var viewStore: FirstViewStore

  private let store: FirstStore

  init(store: FirstStore) {
    self.viewStore = ViewStore(store)
    self.store = store
  }

  var body: some View {
    ZStack {
      Color.purple
        .ignoresSafeArea()
      VStack{
      NavigationLink(
        destination:
          SecondView(
            store:
              store
              .scope(
                state: \FirstState.second,
                action: FirstAction.secondAction
              )
          )
      ) {
        Text("next")
      }
        Button("modal") {
          viewStore.send(.toggle)
        }
      }
      .fullScreenCover (
        isPresented: viewStore.binding(\.$flag),
        content: {
          VStack {
            Button("dismiss") {
              viewStore.send(.toggle)
            }
            FirstModalView(
              store:
                store.scope(
                  state: \.modal,
                  action: FirstAction.modalAction
                )
            )
          }
        }
      )
    }.onAppear {
      viewStore.send(.onAppear)
    }
  }
}

// MARK: Store

typealias FirstStore = Store<
  FirstState,
  FirstAction
>

// MARK: ViewStore

typealias FirstViewStore = ViewStore<
  FirstState,
  FirstAction
>

// MARK: Preview

struct FirstView_Previews: PreviewProvider {

  static var previews: some View {
    ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
      FirstView(store: store)
        .preferredColorScheme(colorScheme)
        .previewLayout(.sizeThatFits)
    }
  }

  static let store: FirstStore = .init(
    initialState: .init(),
    reducer: .init(),
    environment: .init()
  )
}
