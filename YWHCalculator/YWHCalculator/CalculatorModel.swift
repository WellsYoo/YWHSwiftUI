//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Harley-xk on 2019/11/4.
//  Copyright © 2019 Harley. All rights reserved.
//

import Combine
import Foundation

class CalculatorModel: ObservableObject {
    @Published var brain: CalculatorBrain = .left("0")
    
    @Published var history: [CalculatorButtonItem] = []
    
    func applyItem(_ item: CalculatorButtonItem) {
        brain = brain.apply(item: item)
        history.append(item)
        temporaryKept.removeAll()
        slidingIndex = Float(totalCount)
    }
    
    var historyDetail: String {
        return history.map { $0.title }.joined()
    }
    
    // 2
    var temporaryKept: [CalculatorButtonItem] = []
    // 3
    var totalCount: Int {
        history.count + temporaryKept.count
    }

    // 4
    var slidingIndex: Float = 0 {
        didSet { // 5
            // 维护 `history` 和 `temporaryKept`
            keepHistory(upTo: Int(slidingIndex))
        }
    }
    
    func keepHistory(upTo index: Int) {
        precondition(index <= totalCount, "Out of index.")
        let total = history + temporaryKept
        history = Array(total[..<index])
        temporaryKept = Array(total[index...])
        brain = history.reduce(CalculatorBrain.left("0")) {
            result, item in
            result.apply(item: item)
        }
    }
}
