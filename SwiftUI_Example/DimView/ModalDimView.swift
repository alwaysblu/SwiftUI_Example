//
//  ModalDimView.swift
//  Foodiverse
//
//  Copyright © 2022 Togi Inc. All rights reserved.
//

import SwiftUI

public struct ModalDimView<T>: View where T: View {
  let removeView = BackgroundDimView()
  let modal: T
  var isSelected: Binding<Bool>
  let size: CGSize
  let align: Align

  public enum Align {
    case top
    case bottom
    case center
  }

  public init(
    modal: T,
    align: Align,
    size: CGSize,
    isSelected: Binding<Bool>
  ) {
    self.modal = modal
    self.align = align
    self.size = size
    self.isSelected = isSelected
  }

  public var body: some View {
    ZStack {
      removeView
        .onTapGesture {
          withoutAnimation {
            isSelected.wrappedValue.toggle()
          }
        }
      VStack {
        if align == .bottom
        || align == .center {
          Spacer()
        }
        modal
          .frame(
            width: size.width,
            height: size.height
          )
          .clearModalBackground()
        if align == .top
        || align == .center {
          Spacer()
        }
      }
    }.edgesIgnoringSafeArea(.all)
  }
}

extension ModalDimView {
  struct BackgroundDimView: View {
    var body: some View {
      Color.black.opacity(0.001).edgesIgnoringSafeArea(.all)
    }
  }
}
