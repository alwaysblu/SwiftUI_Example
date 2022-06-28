//
//  CalendarView.swift
//  Foodiverse
//
//  Copyright © 2022 Togi Inc. All rights reserved.
//

import ComposableArchitecture
//import FCommon
import SwiftUI

// MARK: View
public struct CalendarView: View {

  @ObservedObject
  private var viewStore: CalendarViewStore

  private let store: CalendarStore
  private let dayColumns: [GridItem]

  public init(store: CalendarStore) {
    self.viewStore = ViewStore(store)
    self.store = store
    self.dayColumns = [GridItem](
      repeating: GridItem(.flexible(minimum: 20, maximum: 100)),
      count: 7
    )
  }

  private var datePicker: some View {
    return DatePickerView(date: viewStore.binding(\.$date))
  }

  public var body: some View {
    VStack {
      datePickerButton
      dayOfWeekGrid
      ScrollView(showsIndicators: false) {
        Spacer(minLength: 10)
        dayGrid
        Spacer(minLength: 10)
      }
      .frame(width: nil, height: 150, alignment: .center)
      .fixedSize(horizontal: false, vertical: true)
    }
    .padding(.horizontal, 15)
    .padding(.vertical, 20)
    .background(.white)
    .fullScreenCover(
      isPresented: viewStore.binding(\.$isActive),
      onDismiss: {
        viewStore.send(.setDate)
      }
    ) {
      GeometryReader { geo in
        ModalDimView(
          modal: datePicker,
          align: .bottom,
          size: CGSize(width: geo.size.width, height: 250),
          isSelected: viewStore.binding(\.$isActive)
        )
      }
    }
  }

  private var datePickerButton: some View {
    HStack {
      Button {
        viewStore.send(.showDatePickerView)
      } label: {
        HStack {
          Text(String(describing: viewStore.year) + " " + viewStore.month.nameOfMonth)
            .foregroundColor(.gray)
            .font(.headline)
          Image("arrow")
          //            .font(.FHeadline2Bold)
          //          Image("arrow", bundle: .common)
        }
      }
      .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)
      Spacer()
    }
  }

  private var dayOfWeekGrid: some View {
    LazyVGrid(
      columns: dayColumns
    ) {
      ForEach(DayOfWeek.allCases, id: \.self) { dayOfWeek in
        Text(dayOfWeek.description)
          .font(.caption2)
          .foregroundColor(.gray)
        //          .font(.FCaption1Semibold)
        //          .foregroundColor(.grey700)
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

  private func makeDayView(_ data: CalendarDay) -> some View {
    VStack(spacing: 6) {
      ZStack {
        if viewStore.currentDay == data.day {
          Circle()
            .scale(2)
            .fill(Color.blue)
          //            .fill(Color.blue500)
        }
        HStack {
          if data.isOrderDay {
            Image("cart")
            //            Image("cart", bundle: .common)
          }
          Spacer()
        }
        if data.day > 0 {
          let cardProgressColor = data.cardProgress
          ? Color.black
          : Color.gray
          //          ? Color.grey700
          //          : Color.grey400
          let dayColor = viewStore.currentDay == data.day
          ? Color(.white)
          : cardProgressColor
          Text(String(format: "%02d", data.day))
            .foregroundColor(dayColor)
            .font(.caption2)
          //            .font(.FCaption1Semibold)
        }
      }
      if data.isHeartExist {
        HStack(spacing: 2) {
          //          Image("heart", bundle: .common)
          Image("heart")
            .resizable()
            .frame(width: 10, height: 10, alignment: .center)
          Text("\(data.heartCount)")
            .foregroundColor(.gray)
            .font(.caption2)
          //            .foregroundColor(.grey500)
          //            .font(.FCaption2Regular)
        }
        .frame(
          width: 25,
          height: 12,
          alignment: .center
        )
      } else {
        Spacer(minLength: 12)
      }
    }
    .onTapGesture {
      viewStore.send(.setCurrentDay(data.day))
    }
    .frame(width: 40)
  }
}

// MARK: Store
public typealias CalendarStore = Store<
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

