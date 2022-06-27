//
//  ContentView.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/06/16.
//

import SwiftUI

struct ContentView: View {
  @State private var top = false
  @State private var center = false
  @State private var bottom = false

  var body: some View {
    VStack {
      Spacer()
      TabView {
        Button("Top") {
          top.toggle()
        }
        .fullScreenCover(isPresented: $top) {
          ModalDimView(
            modal: FullScreenModalView(),
            align: .top,
            size: CGSize(width: 400, height: 250),
            isSelected: $top
          )
        }
        .tabItem {
          Image(systemName: "1.square.fill")
          Text("First")
        }

        Button("Center") {
          center.toggle()
        }
        .fullScreenCover(isPresented: $center) {
          ModalDimView(
            modal: FullScreenModalView(),
            align: .center,
            size: CGSize(width: 400, height: 250),
            isSelected: $center
          )
        }
          .tabItem {
            Image(systemName: "2.square.fill")
            Text("Second")
          }

        Button("Bottom") {
          bottom.toggle()
        }
        .fullScreenCover(isPresented: $bottom) {
          ModalDimView(
            modal: FullScreenModalView(),
            align: .bottom,
            size: CGSize(width: 400, height: 250),
            isSelected: $bottom
          )
        }
          .tabItem {
            Image(systemName: "3.square.fill")
            Text("Third")
          }
          .badge(10)
      }
      .font(.headline)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
