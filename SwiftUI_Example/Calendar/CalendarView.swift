//
//  CalendarView.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/06/20.
//

import ComposableArchitecture
import SwiftUI

// MARK: View

struct CalendarView: View {

  @ObservedObject
  private var viewStore: CalendarViewStore

  private let store: CalendarStore
  private let dayColumns: [GridItem]


  init(store: CalendarStore) {
    self.viewStore = ViewStore(store)
    self.store = store
    self.dayColumns = [
      GridItem(.flexible(minimum: 20, maximum: 100)),
      GridItem(.flexible(minimum: 20, maximum: 100)),
      GridItem(.flexible(minimum: 20, maximum: 100)),
      GridItem(.flexible(minimum: 20, maximum: 100)),
      GridItem(.flexible(minimum: 20, maximum: 100)),
      GridItem(.flexible(minimum: 20, maximum: 100)),
      GridItem(.flexible(minimum: 20, maximum: 100))
    ]
  }

  var body: some View {
    VStack {
      datePickerButton
      ScrollView(showsIndicators: false) {
        dayGrid
          .padding(.horizontal, 0)
      }
      .frame(width: nil, height: 140, alignment: .center)
      .fixedSize(horizontal: false, vertical: true)
    }
    .padding(.horizontal, 24)
    .padding(.vertical, 26)
    .background(.white)
  }

  private var datePickerButton: some View {
    HStack {
      Button {

      } label: {
        HStack() {
          Text("\(viewStore.year) \(viewStore.month)")
            .foregroundColor(.gray)
          Image("arrow")
        }
      }
      Spacer()
    }
  }

  private var dayOfWeekGrid: some View {
    LazyVGrid(
      columns: dayColumns,
      spacing: 10
    ) {
      ForEach(DayOfWeek.allCases, id: \.self) { dayOfWeek in
        Text(dayOfWeek.description).font(.body)
      }
    }.background(.white)
  }

  private var dayGrid: some View {
    LazyVGrid(
      columns: dayColumns,
      spacing: 10,
      pinnedViews: .sectionHeaders) {
        Section(header: dayOfWeekGrid) {
          ForEach(viewStore.totalGrid, id: \.self) { day in
            makeDayView(day)
          }
        }
      }
  }

  private func makeDayView(_ data: DayInformation) -> some View {
    VStack(spacing: 6) {
      HStack(spacing: 4) {
        if data.isOrderDay {
          Image("cart")
        }
        Text(String(format: "%02d", data.day))
          .font(.subheadline)
      }
      if data.heartCount > 0 {
        HStack(spacing: 4) {
          Image("heart")
            .resizable()
            .frame(width: 10, height: 10, alignment: .center)
          Text("\(data.heartCount*10)")
            .font(.caption2)
        }
      } else {
        HStack(spacing: 4) {
          Image("")
            .resizable()
            .frame(width: 10, height: 10, alignment: .center)
          Text("")
            .font(.caption2)
        }
      }
    }
  }
}

// MARK: Store

typealias CalendarStore = Store<
  CalendarState,
  CalendarAction
>

// MARK: ViewStore

typealias CalendarViewStore = ViewStore<
  CalendarState,
  CalendarAction
>

// MARK: Preview

struct CalendarView_Previews: PreviewProvider {

  static var previews: some View {
    ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
      CalendarView(store: store)
        .preferredColorScheme(colorScheme)
        .previewLayout(.sizeThatFits)
    }
  }

  static let store: CalendarStore = .init(
    initialState: .init(),
    reducer: .init(),
    environment: .init()
  )
}
