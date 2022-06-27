//
//  BackgroundDimView.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/06/27.
//

import SwiftUI

struct BackgroundDimView: View {
  var body: some View {
    Color.black.opacity(0.001).edgesIgnoringSafeArea(.all)
  }
}
