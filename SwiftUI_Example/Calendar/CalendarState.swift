//
//  CalendarState.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/06/20.
//

import ComposableArchitecture
import CoreGraphics

struct CalendarState: Equatable {
    var year: Int
    var month: Int
    var totalGrid: [DayInformation]
    var currentDay: Int?
    var itemSize: CGSize = .zero
    var isDatePickerShowUp: Bool
    
    init(
        year: Int,
        month: Int,
        totalGrid: [DayInformation] = [],
        currentDay: Int? = nil,
        itemSize: CGSize = .zero,
        isDatePickerShowUp: Bool = false
    ) {
        let today = Date()
        let year = Calendar.current.component(.year, from: today)
        let month = Calendar.current.component(.month, from: today)
        let day = Calendar.current.component(.day, from: today)
        let weekday = Calendar.current.component(.weekday, from: today)
        
        self.year = year
        self.month = month
        self.totalGrid = Array(1...day)
            .map {
                let heartCount = Int.random(in: 0...2)
                return DayInformation(
                    day: $0,
                    heartCount: Int.random(in: 0...2),
                    isOrderDay: Bool.random(),
                    isHeartExist: heartCount == 0 ? false : true
                )
            }
        for _ in 1...weekday {
            self.totalGrid.insert(DayInformation(day: 0, heartCount: 0, isOrderDay: false, isHeartExist: false), at: 0)
        }
        self.currentDay = currentDay
        self.itemSize = itemSize
        self.isDatePickerShowUp = isDatePickerShowUp
    }
}
