//
//  HistoryView.swift
//  YWHCalculator
//
//  Created by Wells on 2025/4/17.
//

import SwiftUICore
import SwiftUI

struct HistoryView: View {
    @ObservedObject var model: CalculatorModel
    var body: some View {
        VStack {
            // 1
            if model.totalCount == 0 {
                Text("没有履历")
            } else {
                HStack {
                    Text("履历").font(.headline)
                    Text("\(model.historyDetail)").lineLimit(nil)
                }
                HStack {
                    Text("显示").font(.headline)
                    Text("\(model.brain.output)")
                }
                // 2
                Slider(
                    value: $model.slidingIndex,
                    in: 0 ... Float(model.totalCount),
                    step: 1
                )
            }
        }.padding()
    }
}
