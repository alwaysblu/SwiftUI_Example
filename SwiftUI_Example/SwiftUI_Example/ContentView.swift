//
//  ContentView.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/06/16.
//

import SwiftUI

struct ContentView: View {
  @ViewBuilder
    var body: some View {
      NavigationView {
        NavigationLink(
          destination:
            CartView(store: CartStore(initialState: CartState(flag: false), reducer: .init(), environment: .init()))
        ) {
          Text("next")
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
