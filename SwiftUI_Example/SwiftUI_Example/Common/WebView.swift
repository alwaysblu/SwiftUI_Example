//
//  WebViewView.swift
//  Foodiverse
//
//  Copyright © 2022 Togi Inc. All rights reserved.
//

import SwiftUI
import WebKit

// MARK: View

public struct WebView: UIViewRepresentable {
  private let url: String
  private let cookies: [Cookie]
  private var webView: WKWebView

  public init(
    url: String,
    cookies: [Cookie] = [],
    preferredContentMode: WKWebpagePreferences.ContentMode = .mobile
  ) {
    self.url = url
    self.cookies = cookies
    var webView: WKWebView {
      let configuration: WKWebViewConfiguration = .init()
      let defaultWebpagePreferences: WKWebpagePreferences = .init()
      defaultWebpagePreferences.preferredContentMode = preferredContentMode
      configuration.defaultWebpagePreferences = defaultWebpagePreferences

      let cookies: [HTTPCookie] = cookies.compactMap {
        .init(
          properties: [
            .domain: $0.domain,
            .path: "/",
            .name: $0.name,
            .value: $0.value,
            .secure: "TRUE"
          ]
        )
      }
      cookies.forEach {
        configuration
          .websiteDataStore
          .httpCookieStore
          .setCookie($0)
      }
      return WKWebView
        .init(
          frame: .init(),
          configuration: configuration
        )
    }
    self.webView = webView
  }

  public class Coordinator: NSObject, WKNavigationDelegate {
    var parent: WebView

    init(_ uiWebView: WebView) {
      self.parent = uiWebView
    }

    public func webView(
      _ webview: WKWebView,
      didFinish: WKNavigation
    ) {
      guard
        webview
          .configuration
          .defaultWebpagePreferences
          .preferredContentMode != .mobile else {
        return
      }
      guard
        let url = webview.url?.pathComponents else {
        return
      }
      guard
        url.contains("checkout") else {
        return
      }
      webview
        .configuration
        .defaultWebpagePreferences
        .preferredContentMode = .mobile
      webview.reload()
    }

    public func webView(
      _ webView: WKWebView,
      decidePolicyFor navigationAction: WKNavigationAction,
      decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
    ) {
      guard
        let requestURL = navigationAction.request.url else {
        return
      }

      let host = requestURL.host
      if host == "itunes.apple.com"
        && UIApplication.shared.canOpenURL(requestURL) {
        return
      }

      if requestURL.scheme != "http"
        && requestURL.scheme != "https"
        && UIApplication.shared.canOpenURL(requestURL) {
        UIApplication.shared.open(requestURL)
        decisionHandler(.cancel)
      } else {
        decisionHandler(.allow)
      }
    }
  }

  public func getHTML(completion: @escaping (_: Any?, _: Error?) -> Void) {
    DispatchQueue.main.async {
      webView.evaluateJavaScript("document.documentElement.innerHTML", completionHandler: completion)
    }
  }

  public func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  public func makeUIView(context: Context) -> WKWebView {
    webView
  }

  public func updateUIView(
    _ uiView: WKWebView,
    context: Context
  ) {
    uiView.navigationDelegate = context.coordinator
    guard let url = URL(string: url) else {
      return
    }
    uiView.load(
      .init(url: url)
    )
  }
}

// MARK: Preview

struct WebView_Previews: PreviewProvider {
  static var previews: some View {
    WebView(url: "https://togi.co")
  }
}

public struct Cookie: Equatable, Codable {
  public let name: String
  public let value: String
  public let domain: String

  public init(
    name: String = "",
    value: String = "",
    domain: String = ""
  ) {
    self.name = name
    self.value = value
    self.domain = domain
  }
}
