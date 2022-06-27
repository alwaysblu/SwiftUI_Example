//
//  FullScreenModalView.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/06/27.
//

import SwiftUI

struct FullScreenModalView: View {
  @Environment(\.presentationMode)
  var presentationMode

  var body: some View {
    ZStack {
      Color.white.edgesIgnoringSafeArea(.all)
      Button("Dismiss Modal") {
        presentationMode.wrappedValue.dismiss()
      }
    }
  }
}
