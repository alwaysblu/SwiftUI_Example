//
//  DimView.swift
//  SwiftUI_Example
//
//  Created by 맥북 on 2022/06/20.
//

import UIKit
import Combine

class CalendarDimView {
    static let shared = CalendarDimView()
    private init() {}
    private let subject = PassthroughSubject<Date, Never>()
    private let datePickerView: UIDatePicker = {
        let datePicker = UIDatePicker()
        
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .white
        datePicker.layer.cornerRadius = 10
        datePicker.layer.masksToBounds = true
        
        return datePicker
    }()
    private lazy var dimView: UIButton = {
        let dimView = UIButton()
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        dimView.addTarget(self, action: #selector(removeDimView), for: .touchDown)
        dimView.frame = window.frame
        dimView.center = window.center
        dimView.backgroundColor = .black
        dimView.alpha = 0.5
        datePickerView.frame = CGRect(
            x: 0,
            y: window.frame.height-250,
            width: window.frame.width,
            height: 250
        )
        
        return dimView
    }()
    
    func showDimView() -> PassthroughSubject<Date, Never> {
        guard let windowScene = UIApplication
            .shared
            .connectedScenes
            .first as? UIWindowScene else {
            return subject
        }
        windowScene.windows.first?.addSubview(dimView)
        windowScene.windows.first?.addSubview(datePickerView)
        return subject
    }
    
    @objc
    private func removeDimView() {
        subject.send(datePickerView.date)
        dimView.removeFromSuperview()
        datePickerView.removeFromSuperview()
    }
}

