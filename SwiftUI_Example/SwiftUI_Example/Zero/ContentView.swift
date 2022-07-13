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
      ZStack {
        Color.red
          .ignoresSafeArea()
        NavigationLink(
          destination:
            FirstView(
              store:
                  .init(
                    initialState: FirstState(),
                    reducer: .init(),
                    environment: FirstEnvironment()
                  )
            )
        ) {
          Text("next")
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
