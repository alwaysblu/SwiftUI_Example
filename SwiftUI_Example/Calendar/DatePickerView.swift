//
//  DatePickerView.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/06/28.
//

import SwiftUI

struct DatePickerView: View {
  @Binding var date: Date

  var body: some View {
    ZStack {
      Color.white.edgesIgnoringSafeArea(.all)
      datePicker
    }
    .cornerRadius(15)
  }

  var datePicker: some View {
    DatePicker(
      "",
      selection: $date,
      displayedComponents: [.date]
    )
    .datePickerStyle(.wheel)
    .labelsHidden()
  }
}

struct DatePickerView_Previews: PreviewProvider {
  @State static var date = Date()
  static var previews: some View {
    DatePickerView(date: $date)
  }
}
