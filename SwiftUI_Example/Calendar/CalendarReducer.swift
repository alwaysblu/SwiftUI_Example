//
//  CalendarReducer.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/06/20.
//

import ComposableArchitecture
import CoreGraphics
import SwiftUI
import UIKit

typealias CalendarReducer = Reducer<
    CalendarState,
    CalendarAction,
    CalendarEnvironment
>

extension CalendarReducer {
    init() {
        self = Self
            .combine(
                .init { state, action, environment in
                    switch action {
                    case .setItemSize(let entireWidth) :
                        let width = entireWidth / 7
                        state.itemSize = CGSize(width: width, height: width)
                        return .none
                        
                    case .showDatePickerView:
                        return environment
                            .dimView
                            .showDimView()
                            .receive(on: environment.scheduler)
                            .catchToEffect(CalendarAction.setDate)
                        
                    case .setCurrentDay(let currentDay):
                        if state.currentDay != currentDay {
                            state.currentDay = currentDay
                            return .none
                        }
                        
                        state.currentDay = nil
                        
                        return .none
                    case .setDate(.success(let date)):
                        let dateFormatter = DateFormatter()
                        
                        dateFormatter.dateFormat = "yyyy"
                        state.year = Int(dateFormatter.string(from: date)) ?? 1
                        dateFormatter.dateFormat = "M"
                        state.month = Int(dateFormatter.string(from: date)) ?? 1
                        
                        return .none
                    }
                }
            )
    }
}
