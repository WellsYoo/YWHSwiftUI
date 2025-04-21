//
//  ContentView.swift
//  YWHCalculator
//
//  Created by Wells on 2025/4/16.
//

import SwiftUI

struct ContentView: View {
//    @State private var brain: CalculatorBrain = .left("0")
    @EnvironmentObject var model: CalculatorModel

    @State private var editingHistory = false

    let row: [CalculatorButtonItem] = [
        .digit(1), .digit(2), .digit(3), .op(.plus),
    ]
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Button("操作履历: \(model.history.count)") {
                print(self.model.history)
                self.editingHistory = true
            }.sheet(isPresented: self.$editingHistory) {
                HistoryView(model: self.model)
            }
            Text(model.brain.output) // 1
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .trailing
                )

            CalculatorButtonPad()
                .padding(.bottom)
        }
    }
}

struct CalculatorButton: View {
    let fontSize: CGFloat = 30
    let title: String
    let size: CGSize
//    let foregroundColor: Color
    let backgroundColorName: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize))
//                .foregroundColor(foregroundColor)
                .frame(width: size.width, height: size.height)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width / 2)
        }
    }
}

struct CalculatorButtonRow: View {
//    @Binding var brain: CalculatorBrain
//    var model:CalculatorModel
    @EnvironmentObject var model: CalculatorModel
    let row: [CalculatorButtonItem]
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(
                    title: item.title,
                    size: item.size,
                    backgroundColorName: item.backgroundColorName
                ) {
                    print("Button: \(item.title)")
                    self.model.applyItem(item)
                }
            }
        }
    }
}

struct CalculatorButtonPad: View {
//    @EnvironmentObject var model: CalculatorModel

    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip),
         .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)],
    ]
    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) { row in
                CalculatorButtonRow(row: row)
            }
        }
    }
}

#Preview {
    ContentView()
}
