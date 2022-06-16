//
//  ContentView.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/06/16.
//

import SwiftUI

struct ContentView: View {
  @State private var showReaction = false

  var body: some View {

    Image("Logo")
      .offset(y: showReaction ? 0 : 20)
      .scaleEffect(showReaction ? 1 : 0,
                   anchor: .bottom)
      .animation(
        .interpolatingSpring(stiffness: 170,
                             damping: 8)
        .delay(0.1),
        value: showReaction
      )
      .onAppear{
        showReaction.toggle()
      }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
