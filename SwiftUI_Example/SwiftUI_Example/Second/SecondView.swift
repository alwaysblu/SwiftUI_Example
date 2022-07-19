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
      Button("webView", action: {
        viewStore.send(.setModalShowable(true))
      })
      .fullScreenCover (
        isPresented: viewStore.binding(\.$modalShowable),
        content: {
          modalView
        }
      )
    }
    .onDisappear {
      viewStore.send(.setModalShowable(false))
    }
  }

  var modalView: some View {
    VStack {
      Button("dismiss") {
        viewStore.send(.setModalShowable(false))
      }
      cartView
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
