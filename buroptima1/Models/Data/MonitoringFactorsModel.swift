//
//  MonitoringFactorsModel.swift
//  buroptima1
//
//  Created by Nail Safin on 20.07.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import Foundation


// MARK: - MonitoringFactorsModel
struct MonitoringFactorsModel: Codable {
    let md, title, start, stop: String
    let scale: Int
    let indicators: [MonitoringFactorsModelIndicator]
    let code: Int
    let cols: [Col]
    let status, begin, end: String
    let offset: Int
}

// MARK: - Col
struct Col: Codable, Identifiable, Hashable {

    static var zero: Col {
        Col(id: -1, title: "", number: -1, indicators: [])
    }
    
    let id: Int
    let title: String
    let number: Int
    let indicators: [ColIndicator]
    
    static func == (lhs: Col, rhs: Col) -> Bool {
        lhs.id == rhs.id
    }
    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(title)
//    }
}

// MARK: - ColIndicator
struct ColIndicator: Codable, Identifiable, Hashable {
    let title: String
    let min: Double
    let max, factor: Double
    let color: String
    let id, indicatorID, fillStyle, lineStyle: Int
    let value, unit: String

    enum CodingKeys: String, CodingKey {
        case title, min, max, factor, color, id
        case indicatorID = "indicator_id"
        case fillStyle = "fill_style"
        case lineStyle = "line_style"
        case value, unit
    }
    
    static func == (lhs: ColIndicator, rhs: ColIndicator) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - MonitoringFactorsModelIndicator
struct MonitoringFactorsModelIndicator: Codable {
    let id: Int
    let title: String
    let accessFactors: [AccessFactor]

    enum CodingKeys: String, CodingKey {
        case id, title
        case accessFactors = "access_factors"
    }
}

// MARK: - AccessFactor
struct AccessFactor: Codable {
    let indicatorID, factorID: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case indicatorID = "indicator_id"
        case factorID = "factor_id"
        case title
    }
}
