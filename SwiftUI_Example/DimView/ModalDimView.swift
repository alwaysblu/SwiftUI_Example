//
//  ModalDimView.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/06/27.
//

import SwiftUI

struct ModalDimView<T>: View where T: View {
  let removeView = BackgroundDimView()
  let modal: T
  var isSelected: Binding<Bool>
  let size: CGSize
  let align: Align

  enum Align {
    case top
    case bottom
    case center
  }

  init(modal: T, align: Align, size: CGSize, isSelected: Binding<Bool>) {
    self.modal = modal
    self.align = align
    self.size = size
    self.isSelected = isSelected
  }

  var body: some View {
    ZStack {
      removeView
        .onTapGesture {
          isSelected.wrappedValue.toggle()
        }
      VStack{
        if align == .bottom || align == .center {
          Spacer()
        }
        modal
          .frame(width: size.width, height: size.height)
          .clearModalBackground()
        if align == .top || align == .center {
          Spacer()
        }
      }
    }
  }
}
