//
//  YWHCalculatorApp.swift
//  YWHCalculator
//
//  Created by Wells on 2025/4/16.
//

import SwiftUI

@main
struct YWHCalculatorApp: App {
    private let calculatorModel = CalculatorModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(calculatorModel)
        }
    }
}
