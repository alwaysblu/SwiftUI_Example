//
//  Extension.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/06/28.
//

import SwiftUI

extension View {
  public func clearModalBackground() -> some View {
    self.modifier(ClearBackgroundViewModifier())
  }
}

extension View {
  public func withoutAnimation(_ work: @escaping () -> Void) {
    UIView.setAnimationsEnabled(false)
    work()
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
      UIView.setAnimationsEnabled(true)
    }
  }
}

extension View {
  public func fullScreenCover<Content>(
    isPresented: Binding<Bool>,
    animated: Bool = true,
    onDismiss: (() -> Void)? = nil,
    @ViewBuilder content: @escaping () -> Content
  ) -> some View where Content: View {
    if !animated {
      withoutAnimation {
        _ = isPresented.wrappedValue
      }
    }

    return self.fullScreenCover(
      isPresented: isPresented,
      onDismiss: onDismiss,
      content: content
    )
  }
}
