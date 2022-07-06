//
//  CartView.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/06.
//

import ComposableArchitecture
import SwiftUI

// MARK: View

struct CartView: View {

  @ObservedObject
  private var viewStore: CartViewStore

  private let store: CartStore

  init(store: CartStore) {
    self.viewStore = ViewStore(store)
    self.store = store
  }

  var body: some View {
    ScrollView {
      VStack {
        Button("show", action: {
          viewStore.send(.toggle)
        })
      }
      .padding()
    }
    .fullScreenCover (
      isPresented: viewStore.binding(\.$flag),
      content: {
        VStack {
          Text("\(viewStore.a) \(viewStore.b)")
          cartView
        }
      }
    )
  }

@ViewBuilder
var cartView: some View {
  let webView = WebView(url: "https://cart.coupang.com/cartView.pang",
                        preferredContentMode: .desktop)
  webView.onTapGesture {
    webView.getHTML { (html, error) in
      print(html)
    }
  }
}
}

// MARK: Store

typealias CartStore = Store<
  CartState,
  CartAction
>

// MARK: ViewStore

typealias CartViewStore = ViewStore<
  CartState,
  CartAction
>

// MARK: Preview

struct CartView_Previews: PreviewProvider {

  static var previews: some View {
    ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
			CartView(store: store)
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
