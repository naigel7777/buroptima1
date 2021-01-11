//
//  MonitoringModel.swift
//  buroptima1
//
//  Created by Nail Safin on 08.07.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import Foundation
import SwiftyJSON

// MARK: - MonitoringModel
struct MonitoringModel: Codable {
   
        let code: Int
        let data: [Datum]
        let wellFirstTick, wellLastTick, start, stop: Int
        let isEnd: Int

        enum CodingKeys: String, CodingKey {
            case code, data
            case wellFirstTick = "well_first_tick"
            case wellLastTick = "well_last_tick"
            case start, stop
            case isEnd = "is_end"
    }
}

// MARK: - Datum
struct Datum: Codable, Identifiable {
     var id = UUID().uuidString
    let i, tickStart, tickStop: Int
    let indicators: [Indicator]?
    let md: Indicator?

    enum CodingKeys: String, CodingKey {
        case i
        case tickStart = "tick_start"
        case tickStop = "tick_stop"
        case indicators, md
    }
    static var zero: Datum {
        Datum(i: 0, tickStart: 0, tickStop: 0, indicators: nil, md: nil)
    }
    static func != (lhs: Datum, rhs: Datum) -> Bool {
        lhs.tickStart != rhs.tickStart && lhs.i != rhs.i
    }
}

// MARK: - Indicator
struct Indicator: Codable, Identifiable {
    var id = UUID().uuidString
    var indicatorID: Int?
    let exist: Bool
    let max, min: Double?

    enum CodingKeys: String, CodingKey {
        case indicatorID = "indicator_id"
        case exist, max, min
    }
}

enum IndicatorType: Int {
    
    case MD = 1
    case block_position
    case WOB
    case HKLD
    case bit_depth
    case surface_rpm
    case surface_torque
    case ROP
    case SPP
    case mud_flow_in
    case mud_flow_out
    case pump_stroke
    case pump_stroke2
    case total_mud_pit_volume
    case mud_density_in
    case mud_density_out
    case mud_temperature_in
    case mud_temperature_out
    case total_gas
    case ecd
    case plan_depth
    
}
