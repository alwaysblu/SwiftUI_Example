//
//  Second.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/13.
//


import SwiftUI

struct FirstView: View {

  @State var secondState = SecondState(flag: false)

  var body: some View {
    NavigationLink(
      destination:
        SecondView(store: CartStore(initialState: secondState, reducer: .init(), environment: .init()))
    ) {
      Text("next")
    }
  }
}
