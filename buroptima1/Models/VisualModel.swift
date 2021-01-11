//
//  VisualModel.swift
//  buroptima1
//
//  Created by Nail Safin on 22.07.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import Foundation

struct VisualModel {
    static var zero: VisualModel{
        VisualModel(id: 0,
                    title: "",
                    number: 0,
                    titleIndicator: "",
                    min: 0,
                    max: 0.0,
                    factor: 0.0,
                    color: "",
                    indicatorID: .bit_depth,
                    fillStyle: 0,
                    lineStyle: 0,
                    value: "",
                    unit: "",
                    exist: false,
                    stopTime: 0)
    }
    let id: Int
    let title: String
    let number: Int
    // Indicator
    let titleIndicator: String
    let min: Double
    let max, factor: Double
    let color: String
    let indicatorID: IndicatorType
    let fillStyle, lineStyle: Int
    let value, unit: String
    //ArrayData
    var listData: [(min: Double, max: Double, exist: Bool)] = []
    let exist: Bool
    let stopTime: Int
    
}
