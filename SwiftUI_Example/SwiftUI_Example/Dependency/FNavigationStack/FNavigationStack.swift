//
//  FNavigationStack.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/07/15.
//

import SwiftUI

public struct FNavigationView<Label, Destination>: View where Label: View, Destination:View {
  public typealias Body = NavigationLink<Label, Destination>

  public var body: NavigationLink<Label, Destination>

  public init(
    @ViewBuilder destination: () -> Destination,
    @ViewBuilder label: () -> Label
  ) {
    body = NavigationLink(
      destination: destination,
      label: label
    )
  }

  public init(
    isActive: Binding<Bool>,
    @ViewBuilder destination: () -> Destination,
    @ViewBuilder label: () -> Label
  ) {
    body = NavigationLink(
      isActive: isActive,
      destination: destination,
      label: label
    )
  }

  public init<V>(
    tag: V,
    selection: Binding<V?>,
    @ViewBuilder destination: () -> Destination,
    @ViewBuilder label: () -> Label
  ) where V : Hashable {
    body = NavigationLink(
      tag: tag,
      selection: selection,
      destination: destination,
      label: label
    )
  }

  public init(
    _ titleKey: LocalizedStringKey,
    @ViewBuilder destination: () -> Destination
  ) where Label == Text {
    body = NavigationLink(
      titleKey,
      destination: destination
    )
  }

  public init<S>(
    _ title: S,
    @ViewBuilder destination: () -> Destination
  ) where S : StringProtocol, Label == Text {
    body = NavigationLink(
      title,
      destination: destination
    )
  }

  public init(
    _ titleKey: LocalizedStringKey,
    isActive: Binding<Bool>,
    @ViewBuilder destination: () -> Destination
  ) where Label == Text {
    body = NavigationLink(
      titleKey,
      isActive: isActive,
      destination: destination
    )
  }

  public init<S>(
    _ title: S,
    isActive: Binding<Bool>,
    @ViewBuilder destination: () -> Destination
  ) where S : StringProtocol, Label == Text {
    body = NavigationLink(
      title,
      isActive: isActive,
      destination: destination
    )
  }

  public init<V>(
    _ titleKey: LocalizedStringKey,
    tag: V,
    selection: Binding<V?>,
    @ViewBuilder destination: () -> Destination
  ) where V : Hashable, Label == Text {
    body = NavigationLink(
      titleKey,
      tag: tag,
      selection: selection,
      destination: destination
    )
  }

  public init<S, V>(
    _ title: S,
    tag: V,
    selection: Binding<V?>,
    @ViewBuilder destination: () -> Destination
  ) where S : StringProtocol, V : Hashable, Label == Text {
    body = NavigationLink(
      title,
      tag: tag,
      selection: selection,
      destination: destination
    )
  }
}
