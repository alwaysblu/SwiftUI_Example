//
//  Extension.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/06/27.
//

import SwiftUI

struct ClearBackgroundView: UIViewRepresentable {
  class BackgroundView: UIView {
    init() {
      super.init(frame: .zero)
      let window = UIWindow(frame: UIScreen.main.bounds)

      self.frame = window.frame
      self.center = window.center
      self.backgroundColor = .black
      self.alpha = 0.5
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
  }

  func makeUIView(context: Context) -> some UIView {
    let view = UIView()
    let dimView = BackgroundView()

    DispatchQueue.main.async {
      view.superview?.superview?.backgroundColor = .clear
      view.superview?.superview?.superview?.insertSubview(dimView, at: 0)
    }

    return view
  }

  func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct ClearBackgroundViewModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .background(ClearBackgroundView())
  }
}

extension View {
  func clearModalBackground() -> some View {
    self.modifier(ClearBackgroundViewModifier())
  }
}
