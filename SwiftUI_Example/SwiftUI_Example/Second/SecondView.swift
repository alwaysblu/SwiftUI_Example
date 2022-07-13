//
//  CartView.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/06.
//

import ComposableArchitecture
import SwiftUI

// MARK: View

struct SecondView: View {

  @ObservedObject
  private var viewStore: CartViewStore

  private let store: CartStore

  init(store: CartStore) {
    self.viewStore = ViewStore(store)
    self.store = store
  }

  var body: some View {
    ZStack {
      Color.green
        .ignoresSafeArea()
      ScrollView {
        VStack {
          Button("webView", action: {
            viewStore.send(.toggle)
          })
        }
        .padding()
      }
      .fullScreenCover (
        isPresented: viewStore.binding(\.$webViewShowable),
        content: {
          VStack {
            Button("dismiss") {
              viewStore.send(.toggle)
            }
            cartView
          }
        }
      )
    }
  }
  
  @ViewBuilder
  var cartView: some View {
    let webView = WebView(
      url: "https://cart.coupang.com/cartView.pang",
      preferredContentMode: .desktop
    )
    webView.onTapGesture {
      webView.getHTML { (html, error) in
        print(html)
      }
    }
  }
}

// MARK: Store

typealias CartStore = Store<
  SecondState,
  SecondAction
>

// MARK: ViewStore

typealias CartViewStore = ViewStore<
  SecondState,
  SecondAction
>

// MARK: Preview

struct CartView_Previews: PreviewProvider {

  static var previews: some View {
    ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
      SecondView(store: store)
        .preferredColorScheme(colorScheme)
        .previewLayout(.sizeThatFits)
    }
  }

  static let store: CartStore = .init(
    initialState: .init(),
    reducer: .init(),
    environment: .init()
  )
}
