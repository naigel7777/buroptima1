//
//  IntExt.swift
//  buroptima1
//
//  Created by Nail Safin on 20.07.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import Foundation
extension Int {
    var toDateString: String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
              let dateFormatter = DateFormatter()
              dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
              dateFormatter.locale = NSLocale.current
              dateFormatter.dateFormat = "HH:mm dd-MM-yyyy"
               return dateFormatter.string(from: date)
             
    }
}
