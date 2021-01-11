//
//  SaveService.swift
//  buroptima1
//
//  Created by Nail Safin on 16.07.2020.
//  Copyright © 2020 Nail Safin. All rights reserved.
//

import Foundation

enum BuroptimaFields: String {
    case code
    case accessToken
    case personID
    case orgID
}

final class BuroptimaSaveInUD {
    private let provider: ServiceUD
    
    init() {
        provider = ServiceUD()
    }
    
    func save(fields: [BuroptimaFields: String] ) {
        fields.forEach { key, value in
            provider.set(to: key.rawValue, value: value)
        }
        
    }
    
    func get(valueFromField field: BuroptimaFields)-> String  {
        provider.get(from: field.rawValue)
    }
}
