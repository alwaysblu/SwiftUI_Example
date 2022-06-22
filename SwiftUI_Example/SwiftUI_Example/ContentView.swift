//
//  ContentView.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/06/16.
//

import SwiftUI

struct ContentView: View {
  
  let store: CalendarStore = {
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy"
    let year = Int(dateFormatter.string(from: date)) ?? 1
    dateFormatter.dateFormat = "M"
    let month = Int(dateFormatter.string(from: date)) ?? 1
    return CalendarStore(
      initialState: CalendarState(year: year, month: month),
      reducer: CalendarReducer(),
      environment: CalendarEnvironment()
    )
  }()
  
  var body: some View {
    VStack {
      Spacer(minLength: 10)
      CalendarView(store: store)
        .cornerRadius(12)
        .padding(.horizontal, 20)
      Spacer()
      Spacer()
    }.padding(.horizontal, 5)
      .background(.blue)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
