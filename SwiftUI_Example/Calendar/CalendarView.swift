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
      dayOfWeekGrid
      ScrollView(showsIndicators: false) {
        Spacer(minLength: 15)
        dayGrid
      }
      .frame(width: nil, height: 150, alignment: .center)
      .fixedSize(horizontal: false, vertical: true)
    }
    .padding(.horizontal, 15)
    .padding(.vertical, 20)
    .background(.white)
  }

//  private var datePicker: some View {
//    DatePicker(
//      "",
//      selection: viewStore.$date,
//      displayedComponents: [.date]
//    )
//    .background(.white)
//    .datePickerStyle(.compact)
//  }

  private var datePickerButton: some View {
    HStack {
      Button {
        viewStore.send(.showDatePickerView)
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
      columns: dayColumns
    ) {
      ForEach(DayOfWeek.allCases, id: \.self) { dayOfWeek in
        Text(dayOfWeek.description)
          .font(.body)
      }
    }
    .padding(.horizontal, 5)
    .background(.white)
  }

  private var dayGrid: some View {
    LazyVGrid(
      columns: dayColumns,
      spacing: 15
    ) {
      ForEach(viewStore.totalGrid, id: \.self) { day in
        makeDayView(day)
      }
    }.padding(.horizontal, 5)
  }

  private func makeDayView(_ data: DayInformation) -> some View {
    VStack(spacing: 6) {
      ZStack {
        if viewStore.currentDay == data.day {
          Circle()
            .scale(2)
            .fill(.blue)
        }
        HStack {
          if data.isOrderDay {
            Image("cart")
          }
          Spacer()
        }
        Text(String(format: "%02d", data.day))
          .foregroundColor(.black)
          .font(.subheadline)
      }
      if data.isHeartExist {
        HStack(spacing: 2) {
          Image("heart")
            .resizable()
            .frame(width: 10, height: 10, alignment: .center)
          Text("\(data.heartCount)")
            .font(.caption2)
        }
        .frame(
          width: 25,
          height: 12,
          alignment: .center
        )
      } else {
        Spacer(minLength: 12)
      }
    }.onTapGesture {
      viewStore.send(.setCurrentDay(data.day))
    }.frame(width: 40)
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
    initialState: .init(year: 2022, month: 2),
    reducer: .init(),
    environment: .init()
  )
}
