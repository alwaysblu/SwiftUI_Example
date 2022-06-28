//
//  ClearBackgroundViewModifier.swift
//  Foodiverse
//
//  Copyright © 2022 Togi Inc. All rights reserved.
//

import SwiftUI

public struct ClearBackgroundViewModifier: ViewModifier {
  public func body(content: Content) -> some View {
    content
      .background(ClearBackgroundView())
  }
}

extension ClearBackgroundViewModifier {
  public struct ClearBackgroundView: UIViewRepresentable {
    class BackgroundView: UIView {
      init() {
        super.init(frame: .zero)
        let window = UIWindow(frame: UIScreen.main.bounds)

        self.frame = window.frame
        self.center = window.center
        self.backgroundColor = .black
        self.alpha = 0.6
      }

      required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      }
    }

    public func makeUIView(context: Context) -> some UIView {
      let view = UIView()
      let dimView = BackgroundView()

      DispatchQueue.main.async {
        view.superview?.superview?.backgroundColor = .clear
        view.superview?.superview?.superview?.insertSubview(dimView, at: 0)
      }

      return view
    }

    public func updateUIView(_ uiView: UIViewType, context: Context) {}
  }
}
