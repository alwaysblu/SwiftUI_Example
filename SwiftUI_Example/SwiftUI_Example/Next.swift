//
//  Next.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/06.
//

import SwiftUI

struct Next: View {
  @State var flag: Bool = false
    var body: some View {
      ScrollView {
        VStack {
          Button("show", action: {
            flag.toggle()
          })
        }
        .padding()
      }
      .fullScreenCover (
        isPresented: $flag,
        onDismiss: {
//          flag.toggle()
        },
        content: {
          VStack {
            Text("hello")
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

struct Next_Previews: PreviewProvider {
    static var previews: some View {
        Next()
    }
}
