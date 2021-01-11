//
//  Scale.swift
//  buroptima1
//
//  Created by Nail Safin on 20.08.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import Foundation
enum Scale: Int, CaseIterable {
    case tenMin = 10
    case twentyMin = 20
    case thirtyMin = 30
    case oneHour = 60
    case fourHour = 240
    case eightHour = 480
    case twelfHour = 720
    case twentyfourHour = 1440
}

struct ScaleModel {
    let scaleModel : [Scale: String] = [
        .tenMin: "10 min",
        .twentyMin: "20 min",
        .thirtyMin: "30 min",
        .oneHour: "1 hour",
        .fourHour: "4 hour",
        .eightHour: "8 hour",
        .twelfHour: "12 hour",
        .twentyfourHour: "24 hour"
    ]
    func getScale() -> [Scale:String] {
       return scaleModel
    }
    func getScaleInfo(type:Scale) -> String {
        let tmp = scaleModel[type]
        return tmp ?? "XXX" 
    }
    
}
